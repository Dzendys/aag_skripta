# 2.5 Pumping lemma

<a id="def-pumping-lemma"></a>
!!! Theorem "Pumping lemma (pro regulární jazyky)"

    ### Pumping lemma {#def-pumping-lemma}

    **Pumping lemma** je vlastnost regulárních jazyků. Má formu implikace:

    $$ \text{regulární jazyk} \implies \text{pumpující vlastnost} $$

    **Formálně:**

    $$\text{Nechť $L$ je regulární jazyk} \implies (\exists p \ge 1)(\forall w \in L) [|w| \ge p \implies (\exists x, y, z \in \Sigma^*) (w = xyz \land |xy| \le p \land |y| \ge 1 \land (\forall k \ge 0) xy^kz \in L)]$$

!!! Warning "Pozor!"
    Obrácená implikace neplatí! Tedy: $\text{pumpující vlastnost} \nRightarrow \text{regulární jazyk}$.

    To znamená, že pokud jazyk splňuje podmínky pumping lemmatu, nemusí být nutně regulární. Pumping lemma se proto používá především k **důkazu neregularity** jazyka (pomocí obměny implikace).

**Vysvětlení pumpující vlastnosti:**
Neformálně řečeno, pro daný jazyk existuje potenciální konečný automat s $p$ stavy ($p \ge 1$) takový, že pro všechny věty $w$ z jazyka $L$ platí, že pokud $w$ má více či stejný počet symbolů jako je počet stavů KA, pak v automatu musí existovat cyklus.

![Pumping lemma](../../assets/02/pumping_lemma_white.png#only-dark)
![Pumping lemma](../../assets/02/pumping_lemma_black.png#only-light)

Neboli existuje rozdělení věty $w$ na tři části $x, y, z$ takové, že:

*   $x$ je část věty před cyklem,
*   $y$ je část s cyklem,
*   $z$ je zbytek věty.

Zároveň platí podmínky:

*   $|xy| \le p$: cyklus musí přijít během prvních $p$ stavů.
*   $|y| \ge 1$: cyklus musí existovat (nesmí být prázdný).
*   Všechny věty, které vzniknou pumpováním $y$ (procházením cyklu $k$-krát), patří též do jazyka $L$.