package edu.westminstercollege.cmpt355.minijava.node;

import java.util.List;

public record VarDeclarationInit() implements Node {
    @Override
    public List<? extends Node> children() {
        return null;
    }
}