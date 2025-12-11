# 3.2 Algoritmus Cocke-Younger-Kasami

<a id="algo-cyk"></a>
!!! Algorithm "Algoritmus Cocke-Younger-Kasami (CYK)"

    ### Algoritmus CYK {#algo-cyk}

    **Algoritmus Cocke-Younger-Kasami** (CYK) je algoritmus, který na vstupu dostane bezkontextovou gramatiku v **normálním tvaru podle Chomského** a nějaký řetězec $w$. Výstupem tohoto algoritmu je odpověď zdali $w \in L(G)$, nebo $w \notin L(G)$.

    **Postup:**

    1.  Vytvoříme **tabulku**, kde počet řádků i sloupců je roven $|w|$.
    2.  Řádky i sloupce **očíslujeme**. Vedle prvního sloupce (shora dolů) si též jako pomůcku můžeme vepsat řetězec $w$. Buňky v pravé dolní části tabulky nebudeme vyplňovat.
        
        !!! Implication "Význam buňky"
            Buňka $(r, c)$ je v řádku $r$ a sloupci $c$. Tato buňka bude po vyplnění obsahovat množinu neterminálů, které od pozice $r$ v řetězci $w$ generují $c$ symbolů.

    3.  Nejprve **vyplníme sloupec č. 1** (prázdný sloupec, který je nejvíce vlevo):
        *   Do buňky $(r, 1)$ zapíšeme všechny neterminály $A$, pro které existuje pravidlo $A \to a$, kde $a$ je symbol na $r$-té pozici v řetězci $w$.

    4.  Pokračujeme dalšími sloupci $c = 2, 3, \dots, |w|$. Pro vyplnění buňky $(r, c)$ hledáme neterminály $A$, pro které existuje pravidlo $A \to BC$, takové že:
        *   $B$ generuje první část podřetězce (délky $k$) a $C$ generuje zbylou část (délky $c-k$).
        *   Provádíme tedy „kartézský součin“ buněk $(r, k)$ a $(r+k, c-k)$ pro všechna $1 \le k < c$.
        *   Pokud najdeme takovou kombinaci $B, C$, přidáme $A$ do buňky $(r, c)$.

    5.  **Výsledek:** Pokud je **počáteční neterminál** $S$ obsažen v poslední buňce tabulky, tj. $S \in (1, |w|)$, poté $w \in L(G)$. Jinak $w \notin L(G)$.

    !!! Implication "Trik pro rychlejší vyplňování (Ruce na stůl!)"
        Chceme-li vyplnit buňku $(r, c)$:
        
        1.  **Levou rukou** suneme po daném řádku ($r$) úplně vlevo – tj. na buňku $(r, 1)$.
        2.  **Pravou rukou** posuneme diagonálně vlevo dolů o jednu buňku – tj. na buňku $(r+1, c-1)$.
        3.  Provedeme „kartézský součin“ těchto buněk. V gramatice hledáme neterminály, které mají na pravé straně některou z kombinací.
        4.  Posuneme **levou ruku** o jednu buňku vpravo a **pravou** o jednu buňku diagonálně vlevo dolů a opakujeme součin.
        5.  Opakujeme, dokud se ruce „nestřetnou“ (resp. dokud je možný posun).
    
    !!! Warning "Orientace tabulky"
        V této metodě se tabulka vyplňuje zleva do prava. Jiná metoda může tabulku libovolně otočit a vyplňovat tudíž jiným směrem.

---

*Příklad:*
Mějme gramatiku G zadanou jako:

$$\begin{aligned}
G &= (\{A, B, C\}, \{0, 1\}, P, A), \text{ kde} \\
P &= \{ A \to BC \mid AB \mid 1, \\
  &\phantom{=\{ } B \to AA \mid 0, \\
  &\phantom{=\{ } C \to CB \mid 1 \mid 0 \}
\end{aligned}$$

a řetězec $w$ = `110100`. Vyplněná tabulka vypadá:


![CYK tabulka](../../assets/03/cyk_priklad_tabulka_white.png#only-dark){ width=75% }
![CYK tabulka](../../assets/03/cyk_priklad_tabulka_black.png#only-light){ width=75% }