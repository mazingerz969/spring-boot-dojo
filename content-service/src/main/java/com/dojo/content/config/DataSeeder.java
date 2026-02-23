package com.dojo.content.config;

import com.dojo.content.entity.Flashcard;
import com.dojo.content.repository.FlashcardRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.List;

@Configuration
public class DataSeeder {

    @Bean
    CommandLineRunner seedFlashcards(FlashcardRepository repository) {
        return args -> {
            if (repository.count() == 0) {
                repository.saveAll(List.of(
                        new Flashcard(
                                "What does @SpringBootApplication do?",
                                "Combines @Configuration, @EnableAutoConfiguration, and @ComponentScan. It marks the main class of a Spring Boot application.",
                                "SPRING_BASICS", "BLANCO"),
                        new Flashcard(
                                "What is Dependency Injection (DI)?",
                                "A design pattern where objects receive their dependencies from an external source rather than creating them. Spring uses DI via constructor injection, setter injection, or field injection.",
                                "SPRING_BASICS", "BLANCO"),
                        new Flashcard(
                                "What is the difference between @Component, @Service, and @Repository?",
                                "All are stereotypes for component scanning. @Service indicates business logic, @Repository indicates data access (adds persistence exception translation), and @Component is a generic stereotype.",
                                "SPRING_BASICS", "BLANCO"),
                        new Flashcard(
                                "What does @RestController do?",
                                "Combines @Controller and @ResponseBody. Every method returns data directly (JSON by default) instead of a view name.",
                                "REST_API", "AMARILLO"),
                        new Flashcard(
                                "What is Spring Data JPA?",
                                "A Spring module that simplifies data access by providing repository abstractions. You define interfaces extending JpaRepository and Spring generates the implementation automatically.",
                                "DATA_ACCESS", "AMARILLO")
                ));
            }
        };
    }
}
