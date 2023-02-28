package edu.westminstercollege.cmpt355.minijava.node;

import java.util.List;

public record BooleanLiteral(boolean bool) implements Expression {
    @Override
    public List<? extends Node> children() {
        return List.of();
    }

    @Override
    public String getNodeDescription () {
        return String.format("BooleanLiteral [text: %b]", bool);
    }
}
