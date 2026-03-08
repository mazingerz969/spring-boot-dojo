package com.dojo.monolith.frontend.controller;

import com.dojo.monolith.content.entity.Quiz;
import com.dojo.monolith.content.service.QuizService;
import com.dojo.monolith.progress.dto.AnswerRequest;
import com.dojo.monolith.progress.service.ProgressService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

@Controller
public class QuizWebController {

    private final QuizService quizService;
    private final ProgressService progressService;

    public QuizWebController(QuizService quizService, ProgressService progressService) {
        this.quizService = quizService;
        this.progressService = progressService;
    }

    @GetMapping("/quiz")
    public String startQuiz(@RequestParam(defaultValue = "BLANCO") String difficulty, HttpSession session) {
        String username = (String) session.getAttribute("username");
        if (username == null) return "redirect:/login";

        List<Quiz> quizzes = quizService.findByDifficulty(difficulty);
        Collections.shuffle(quizzes);
        if (quizzes.size() > 5) quizzes = quizzes.subList(0, 5);

        session.setAttribute("quizQuestions", quizzes);
        session.setAttribute("quizCurrentIndex", 0);
        session.setAttribute("quizCorrect", 0);
        session.setAttribute("quizTotal", 0);
        session.setAttribute("quizDifficulty", difficulty);
        session.setAttribute("quizAnswers", new ArrayList<Map<String, Object>>());

        return "redirect:/quiz/question";
    }

    @GetMapping("/quiz/question")
    @SuppressWarnings("unchecked")
    public String showQuestion(HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        if (username == null) return "redirect:/login";

        List<Quiz> questions = (List<Quiz>) session.getAttribute("quizQuestions");
        Integer currentIndex = (Integer) session.getAttribute("quizCurrentIndex");

        if (questions == null || currentIndex == null || currentIndex >= questions.size()) {
            return "redirect:/quiz/results";
        }

        Quiz current = questions.get(currentIndex);
        model.addAttribute("question", current);
        model.addAttribute("currentIndex", currentIndex + 1);
        model.addAttribute("totalQuestions", questions.size());
        model.addAttribute("score", session.getAttribute("quizCorrect"));

        return "quiz";
    }

    @PostMapping("/quiz/answer")
    @SuppressWarnings("unchecked")
    public String submitAnswer(@RequestParam int selectedOption, HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        if (username == null) return "redirect:/login";

        List<Quiz> questions = (List<Quiz>) session.getAttribute("quizQuestions");
        Integer currentIndex = (Integer) session.getAttribute("quizCurrentIndex");
        Integer correct = (Integer) session.getAttribute("quizCorrect");
        Integer total = (Integer) session.getAttribute("quizTotal");
        List<Map<String, Object>> answers = (List<Map<String, Object>>) session.getAttribute("quizAnswers");
        String difficulty = (String) session.getAttribute("quizDifficulty");

        Quiz current = questions.get(currentIndex);
        boolean isCorrect = selectedOption == current.getCorrectOption();

        if (isCorrect) correct++;
        total++;

        // Record progress
        try {
            AnswerRequest req = new AnswerRequest();
            req.setUsername(username);
            req.setBeltLevel(difficulty);
            req.setCorrect(isCorrect);
            progressService.recordAnswer(req);
        } catch (Exception ignored) {}

        // Store answer for review
        Map<String, Object> answerRecord = new HashMap<>();
        answerRecord.put("question", current.getQuestion());
        answerRecord.put("selectedOption", selectedOption);
        answerRecord.put("correctOption", current.getCorrectOption());
        answerRecord.put("correct", isCorrect);
        String[] options = {current.getOptionA(), current.getOptionB(), current.getOptionC(), current.getOptionD()};
        answerRecord.put("options", options);
        answers.add(answerRecord);

        session.setAttribute("quizCorrect", correct);
        session.setAttribute("quizTotal", total);
        session.setAttribute("quizAnswers", answers);

        // Show feedback
        model.addAttribute("question", current);
        model.addAttribute("selectedOption", selectedOption);
        model.addAttribute("isCorrect", isCorrect);
        model.addAttribute("score", correct);
        model.addAttribute("total", total);
        model.addAttribute("currentIndex", currentIndex + 1);
        model.addAttribute("totalQuestions", questions.size());
        model.addAttribute("hasNext", currentIndex + 1 < questions.size());

        session.setAttribute("quizCurrentIndex", currentIndex + 1);

        return "quiz-feedback";
    }

    @GetMapping("/quiz/next")
    public String nextQuestion() {
        return "redirect:/quiz/question";
    }

    @GetMapping("/quiz/results")
    @SuppressWarnings("unchecked")
    public String showResults(HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        if (username == null) return "redirect:/login";

        Integer correct = (Integer) session.getAttribute("quizCorrect");
        Integer total = (Integer) session.getAttribute("quizTotal");
        List<Map<String, Object>> answers = (List<Map<String, Object>>) session.getAttribute("quizAnswers");
        String difficulty = (String) session.getAttribute("quizDifficulty");

        if (correct == null) correct = 0;
        if (total == null || total == 0) total = 1;

        int percentage = (int) ((correct * 100.0) / total);

        model.addAttribute("correct", correct);
        model.addAttribute("total", total);
        model.addAttribute("percentage", percentage);
        model.addAttribute("answers", answers != null ? answers : List.of());
        model.addAttribute("difficulty", difficulty);

        return "quiz-result";
    }
}
