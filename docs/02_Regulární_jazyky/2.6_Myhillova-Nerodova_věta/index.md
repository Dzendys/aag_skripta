# 2.6 Myhillova-Nerodova věta

<a id="def-prava-kongruence"></a>
!!! Definition "[Definice (Pravá kongruence)](#def-prava-kongruence)"

    ### Pravá kongruence {#def-prava-kongruence}

    Nechť $\Sigma$ je abeceda a $\sim$ je relace **ekvivalence** (tj. reflexivní, symetrická a tranzitivní) na $\Sigma^*$. Řekneme, že $\sim$ je **pravá kongruence**, jestliže navíc platí:

    $$
    \forall u, v, w \in \Sigma^* : u \sim v \implies uw \sim vw
    $$

<a id="def-konecny-index"></a>
!!! Definition "[Definice (Konečný index)](#def-konecny-index)"

    ### Konečný index {#def-konecny-index}

    Pravá kongruence $\sim$ je **konečného indexu**, má-li rozklad $\Sigma^* / \sim$ konečně mnoho tříd.

<a id="def-prefixova-ekvivalence"></a>
!!! Definition "[Definice (Prefixová ekvivalence)](#def-prefixova-ekvivalence)"

    ### Prefixová ekvivalence {#def-prefixova-ekvivalence}

    Nechť $L$ je libovolný jazyk nad abecedou $\Sigma$. **Prefixovou ekvivalenci** $\sim_L$ na $\Sigma^*$ pro jazyk $L$ definujeme následovně:

    $$
    u \sim_L v \iff (\forall w \in \Sigma^* : uw \in L \iff vw \in L)
    $$

<a id="theorem-myhill-nerode"></a>
!!! Theorem "[Věta 2.1 (Myhillova-Nerodova věta)](#theorem-myhill-nerode)"

    ### Myhillova-Nerodova věta {#theorem-myhill-nerode}

    **Myhillova-Nerodova věta** je vlastnost regulárních jazyků. Pro regulární jazyk $L$ nad abecedou $\Sigma$ nám tato věta říká, že následující tři tvrzení jsou **ekvivalentní**:

    *   $L$ je jazyk přijímaný deterministickým konečným automatem.
    *   Pro $L$ existuje pravá kongruence $\sim$ konečného indexu na $\Sigma^*$ taková, že $L$ je sjednocením některých jejích tříd rozkladu $\Sigma^* / \sim$.
    *   Relace prefixové ekvivalence $\sim_L$ má konečný index.

!!! Note "Vlastnost prefixové ekvivalence"
    Pro každý formální jazyk $L$ platí, že prefixová ekvivalence $\sim_L$ je **pravou kongruencí** na $\Sigma^*$. Navíc je největší pravou kongruencí (má nejmenší počet tříd, tj. nejmenší index), jejíž třídy lze sjednotit do jazyka $L$.

<a id="theorem-myhill-nerode-2"></a>
!!! Theorem "[Věta (2. varianta Myhillovy-Nerodovy věty – Minimalita DKA)](#theorem-myhill-nerode-2)"

    ### Myhillova-Nerodova věta a minimální DKA {#theorem-myhill-nerode-2}

    Počet stavů libovolného **minimálního DKA** přijímajícího jazyk $L$ je roven **indexu prefixové ekvivalence** $\sim_L$:

    $$
    |Q_{min}| = \text{index}(\sim_L)
    $$

    (Takový konečný automat existuje právě tehdy, když je index $\sim_L$ konečný.)

    Stavy minimálního DKA $M = (Q, \Sigma, \delta, q_0, F)$ lze přímo zkonstruovat z tříd rozkladu $\Sigma^* / \sim_L$:

    *   $Q = \Sigma^* / \sim_L$ (stavy jsou třídy ekvivalence $[u]$),
    *   $q_0 = [\varepsilon]$,
    *   $\delta([u], a) = [ua]$ pro všechna $u \in \Sigma^*, a \in \Sigma$,
    *   $F = \{[x] \mid x \in L\}$.