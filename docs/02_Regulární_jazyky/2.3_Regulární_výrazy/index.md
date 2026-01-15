# 2.3 Regulární výrazy

<a id="def-regularni-vyraz"></a>
!!! Definition "[Definice (Regulární výraz)](#def-regularni-vyraz)"

    ### Regulární výraz {#def-regularni-vyraz}

    **Regulární výraz** (RV) definujeme rekurzivně nad abecedou $\Sigma$ takto:

    1. $\emptyset, \varepsilon, a$ jsou regulární výrazy pro všechna $a \in \Sigma$.
    2. Jsou-li $x, y$ regulární výrazy nad $\Sigma$, pak $(x + y)$, $(x \cdot y)$ a $(x)^*$ jsou regulární výrazy nad $\Sigma$.

    *   **Priorita operátorů:** Operátor iterace ($^*$) má nejvyšší prioritu, operátor zřetězení ($\cdot$) má druhou nejvyšší prioritu a operátor sjednocení ($+$) má nejnižší prioritu. Pokud chceme prioritu změnit, můžeme využít závorky.
    *   Místo $x \cdot y$ budeme často psát jen $xy$.

<a id="def-hodnota-rv"></a>
!!! Definition "[Definice (Hodnota regulárního výrazu)](#def-hodnota-rv)"

    ### Hodnota regulárního výrazu {#def-hodnota-rv}

    **Hodnota (jazyk) regulárního výrazu** je regulární jazyk, který daný regulární výraz reprezentuje. Formálně definujeme hodnotu $h(V)$ regulárního výrazu $V$ následovně:

    1. $h(\emptyset) = \emptyset$ (prázdný regulární výraz reprezentuje prázdný jazyk),
    2. $h(\varepsilon) = \{\varepsilon\}$ (regulární výraz $\varepsilon$ reprezentuje jednoprvkový jazyk s prvkem $\varepsilon$),
    3. $h(a) = \{a\}$, kde $a \in \Sigma$,
    4. $h(x + y) = h(x) \cup h(y)$,
    5. $h(x \cdot y) = h(x) \cdot h(y)$,
    6. $h(x^*) = (h(x))^*$.
