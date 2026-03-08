package com.dojo.frontend.controller.guia;

import java.util.*;

/**
 * Utilidades compartidas para los capítulos de la guía.
 */
public class GuiaHelper {

    public static Map<String, Object> crearPaso(int num, String title, String icon, String intro, List<Map<String, String>> sections) {
        Map<String, Object> paso = new LinkedHashMap<>();
        paso.put("num", num);
        paso.put("title", title);
        paso.put("icon", icon);
        paso.put("intro", intro);
        paso.put("sections", sections);
        return paso;
    }

    public static Map<String, String> section(String title, String content) {
        Map<String, String> s = new LinkedHashMap<>();
        s.put("title", title);
        s.put("content", content);
        return s;
    }
}
