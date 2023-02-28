package edu.westminstercollege.cmpt355.minijava.node;

import java.util.List;

public record VarDeclarationInit(TypeNode type, String name, Expression value) implements Node {
    @Override
    public List<? extends Node> children() {
        return List.of(value);
    }

    @Override
    public String getNodeDescription () {
        return String.format("VarDeclarationInit [name: %s]", name);
    }
}
