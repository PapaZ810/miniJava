package edu.westminstercollege.cmpt355.minijava.node;

import java.util.List;

public record PostIncrement(VariableAccess var, String op) implements Expression {
    @Override
    public List<? extends Node> children() {
        return List.of(var);
    }

    @Override
    public String getNodeDescription() {
        return String.format("PreIncrement [op: %s]", op);
    }
}
