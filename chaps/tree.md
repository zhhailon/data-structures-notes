# 5. Trees

A tree $$T$$ is defined to be 
 defines a *one-to-many* relation

## 5.1. Binary Trees


!dot(tree1.png)(Jake's Pizza Shop)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
digraph {
    node [shape=box];
    root [label="Owner: Jake"];
    n1 [label="Manager: Brad"];
    n2 [label="Chef: Carol"];
    n3 [label="Waitress: Joyce"];
    n4 [label="Waiter: Chris"];
    n41 [label="Waiter: John"];
    n5 [label="Cook: Max"];
    n6 [label="Helper: Len"];
    root -> n1;
    root -> n2;
    n1 -> n3;
    n1 -> n4;
    n1 -> n41;
    n2 -> n5;
    n2 -> n6;
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~