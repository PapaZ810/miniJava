package edu.westminstercollege.cmpt355.minijava.node;

import java.util.List;

public record VariableAccess(String variableName) implements Expression {
    @Override
    public List<? extends Node> children() {
        return List.of();
    }

    @Override
    public String getNodeDescription() {
        return String.format("VariableAccess [name: %s]", variableName);
    }
}
