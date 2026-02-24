package com.dojo.frontend.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.*;

@Controller
public class QuizController {

    private final RestTemplate restTemplate;
    private final String gatewayUrl;

    public QuizController(RestTemplate restTemplate,
                          @Value("${gateway.url}") String gatewayUrl) {
        this.restTemplate = restTemplate;
        this.gatewayUrl = gatewayUrl;
    }

    @GetMapping("/quiz")
    public String startQuiz(@RequestParam String difficulty, HttpSession session, Model model) {
        String token = (String) session.getAttribute("token");
        if (token == null) {
            return "redirect:/login";
        }

        try {
            HttpHeaders headers = new HttpHeaders();
            headers.set("Authorization", "Bearer " + token);
            HttpEntity<Void> entity = new HttpEntity<>(headers);

            ResponseEntity<List<Map<String, Object>>> response = restTemplate.exchange(
                    gatewayUrl + "/api/content/quizzes?difficulty=" + difficulty,
                    HttpMethod.GET, entity,
                    new ParameterizedTypeReference<>() {});

            List<Map<String, Object>> quizzes = response.getBody();
            if (quizzes == null || quizzes.isEmpty()) {
                model.addAttribute("error", "No quizzes available for this level.");
                return "redirect:/dashboard";
            }

            // Store quiz data in session for this quiz session
            session.setAttribute("quizQuestions", quizzes);
            session.setAttribute("quizDifficulty", difficulty);
            session.setAttribute("quizCurrentIndex", 0);
            session.setAttribute("quizCorrect", 0);
            session.setAttribute("quizTotal", 0);
            session.setAttribute("quizAnswers", new ArrayList<Map<String, Object>>());

        } catch (Exception e) {
            return "redirect:/dashboard";
        }

        return "redirect:/quiz/question";
    }

    @GetMapping("/quiz/question")
    public String showQuestion(HttpSession session, Model model) {
        String token = (String) session.getAttribute("token");
        if (token == null) {
            return "redirect:/login";
        }

        @SuppressWarnings("unchecked")
        List<Map<String, Object>> quizzes = (List<Map<String, Object>>) session.getAttribute("quizQuestions");
        Integer currentIndex = (Integer) session.getAttribute("quizCurrentIndex");
        String difficulty = (String) session.getAttribute("quizDifficulty");

        if (quizzes == null || currentIndex == null) {
            return "redirect:/dashboard";
        }

        if (currentIndex >= quizzes.size()) {
            return "redirect:/quiz/results";
        }

        Map<String, Object> currentQuiz = quizzes.get(currentIndex);

        model.addAttribute("username", session.getAttribute("username"));
        model.addAttribute("quiz", currentQuiz);
        model.addAttribute("questionNumber", currentIndex + 1);
        model.addAttribute("totalQuestions", quizzes.size());
        model.addAttribute("correct", session.getAttribute("quizCorrect"));
        model.addAttribute("difficulty", difficulty);
        model.addAttribute("beltLabel", getBeltLabel(difficulty));

        return "quiz";
    }

    @PostMapping("/quiz/answer")
    public String submitAnswer(@RequestParam int selectedOption, HttpSession session, Model model) {
        String token = (String) session.getAttribute("token");
        if (token == null) {
            return "redirect:/login";
        }

        @SuppressWarnings("unchecked")
        List<Map<String, Object>> quizzes = (List<Map<String, Object>>) session.getAttribute("quizQuestions");
        Integer currentIndex = (Integer) session.getAttribute("quizCurrentIndex");
        String difficulty = (String) session.getAttribute("quizDifficulty");
        String username = (String) session.getAttribute("username");

        if (quizzes == null || currentIndex == null || currentIndex >= quizzes.size()) {
            return "redirect:/dashboard";
        }

        Map<String, Object> currentQuiz = quizzes.get(currentIndex);
        int correctOption = ((Number) currentQuiz.get("correctOption")).intValue();
        boolean isCorrect = selectedOption == correctOption;

        if (isCorrect) {
            session.setAttribute("quizCorrect", (Integer) session.getAttribute("quizCorrect") + 1);
        }
        session.setAttribute("quizTotal", (Integer) session.getAttribute("quizTotal") + 1);

        // Record progress via progress-service
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.set("Authorization", "Bearer " + token);
            headers.setContentType(MediaType.APPLICATION_JSON);

            Map<String, Object> body = Map.of(
                    "username", username,
                    "beltLevel", difficulty,
                    "correct", isCorrect
            );
            HttpEntity<Map<String, Object>> entity = new HttpEntity<>(body, headers);
            restTemplate.postForEntity(gatewayUrl + "/api/progress/record", entity, Object.class);
        } catch (Exception ignored) {
            // Progress recording is best-effort
        }

        // Track answer for results page
        @SuppressWarnings("unchecked")
        List<Map<String, Object>> answers = (List<Map<String, Object>>) session.getAttribute("quizAnswers");
        if (answers == null) {
            answers = new ArrayList<>();
        }

        String[] optionLabels = {"A", "B", "C", "D"};
        String correctOptionText = switch (correctOption) {
            case 0 -> (String) currentQuiz.get("optionA");
            case 1 -> (String) currentQuiz.get("optionB");
            case 2 -> (String) currentQuiz.get("optionC");
            case 3 -> (String) currentQuiz.get("optionD");
            default -> "Unknown";
        };

        Map<String, Object> answerRecord = new LinkedHashMap<>();
        answerRecord.put("question", currentQuiz.get("question"));
        answerRecord.put("correct", isCorrect);
        answerRecord.put("correctAnswer", optionLabels[correctOption] + ": " + correctOptionText);
        answers.add(answerRecord);
        session.setAttribute("quizAnswers", answers);

        // Show feedback
        model.addAttribute("username", session.getAttribute("username"));
        model.addAttribute("quiz", currentQuiz);
        model.addAttribute("selectedOption", selectedOption);
        model.addAttribute("correctOption", correctOption);
        model.addAttribute("isCorrect", isCorrect);
        model.addAttribute("questionNumber", currentIndex + 1);
        model.addAttribute("totalQuestions", quizzes.size());
        model.addAttribute("correct", session.getAttribute("quizCorrect"));
        model.addAttribute("difficulty", difficulty);
        model.addAttribute("beltLabel", getBeltLabel(difficulty));
        model.addAttribute("hasNext", currentIndex + 1 < quizzes.size());
        model.addAttribute("optionKeys", List.of("optionA", "optionB", "optionC", "optionD"));
        model.addAttribute("optionLabels", List.of("A", "B", "C", "D"));

        return "quiz-feedback";
    }

    @GetMapping("/quiz/next")
    public String nextQuestion(HttpSession session) {
        Integer currentIndex = (Integer) session.getAttribute("quizCurrentIndex");
        if (currentIndex != null) {
            session.setAttribute("quizCurrentIndex", currentIndex + 1);
        }
        return "redirect:/quiz/question";
    }

    @GetMapping("/quiz/results")
    public String showResults(HttpSession session, Model model) {
        String token = (String) session.getAttribute("token");
        if (token == null) {
            return "redirect:/login";
        }

        Integer correct = (Integer) session.getAttribute("quizCorrect");
        Integer total = (Integer) session.getAttribute("quizTotal");
        String difficulty = (String) session.getAttribute("quizDifficulty");

        @SuppressWarnings("unchecked")
        List<Map<String, Object>> answers = (List<Map<String, Object>>) session.getAttribute("quizAnswers");

        if (correct == null || total == null) {
            return "redirect:/dashboard";
        }

        int percentage = total > 0 ? (correct * 100) / total : 0;

        model.addAttribute("username", session.getAttribute("username"));
        model.addAttribute("correct", correct);
        model.addAttribute("total", total);
        model.addAttribute("percentage", percentage);
        model.addAttribute("difficulty", difficulty);
        model.addAttribute("beltLabel", getBeltLabel(difficulty));
        model.addAttribute("answers", answers != null ? answers : Collections.emptyList());

        // Clean quiz session data
        session.removeAttribute("quizQuestions");
        session.removeAttribute("quizCurrentIndex");
        session.removeAttribute("quizCorrect");
        session.removeAttribute("quizTotal");
        session.removeAttribute("quizDifficulty");
        session.removeAttribute("quizAnswers");

        return "quiz-result";
    }

    private String getBeltLabel(String difficulty) {
        return switch (difficulty) {
            case "BLANCO" -> "White Belt";
            case "AMARILLO" -> "Yellow Belt";
            case "NARANJA" -> "Orange Belt";
            case "VERDE" -> "Green Belt";
            case "MARRON" -> "Brown Belt";
            case "NEGRO" -> "Black Belt";
            default -> difficulty;
        };
    }
}
