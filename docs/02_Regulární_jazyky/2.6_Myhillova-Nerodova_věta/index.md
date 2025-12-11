# 2.6 Myhillova-Nerodova věta

<a id="def-prava-kongruence"></a>
!!! Definition "Definice (Pravá kongruence)"

    ### Pravá kongruence {#def-prava-kongruence}

    Nechť $\Sigma$ je abeceda a $\sim$ je relace **ekvivalence** (tj. reflexivní, symetrická a tranzitivní) na $\Sigma^*$. Řekneme, že $\sim$ je **pravá kongruence**, jestliže navíc platí:

    $$
    \forall u, v, w \in \Sigma^* : u \sim v \implies uw \sim vw
    $$

<a id="def-konecny-index"></a>
!!! Definition "Definice (Konečný index)"

    ### Konečný index {#def-konecny-index}

    Pravá kongruence $\sim$ je **konečného indexu**, má-li rozklad $\Sigma^* / \sim$ konečně mnoho tříd.

<a id="def-prefixova-ekvivalence"></a>
!!! Definition "Definice (Prefixová ekvivalence)"

    ### Prefixová ekvivalence {#def-prefixova-ekvivalence}

    Nechť $L$ je libovolný jazyk nad abecedou $\Sigma$. **Prefixovou ekvivalenci** $\sim_L$ na $\Sigma^*$ pro jazyk $L$ definujeme následovně:

    $$
    u \sim_L v \iff (\forall w \in \Sigma^* : uw \in L \iff vw \in L)
    $$

<a id="theorem-myhill-nerode"></a>
!!! Theorem "Věta 2.1 (Myhillova-Nerodova věta)"

    ### Myhillova-Nerodova věta {#theorem-myhill-nerode}

    **Myhillova-Nerodova věta** je vlastnost regulárních jazyků. Pro regulární jazyk $L$ nad abecedou $\Sigma$ nám tato věta říká, že následující tři tvrzení jsou **ekvivalentní**:

    *   $L$ je jazyk přijímaný deterministickým konečným automatem.
    *   Pro $L$ existuje pravá kongruence $\sim$ konečného indexu na $\Sigma^*$ taková, že $L$ je sjednocením některých jejích tříd rozkladu $\Sigma^* / \sim$.
    *   Relace prefixové ekvivalence $\sim_L$ má konečný index.