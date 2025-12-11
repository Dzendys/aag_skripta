# 2.4 Převody mezi RG, RV a KA

Tato kapitola shrnuje algoritmické postupy pro převody mezi regulárními gramatikami (RG), regulárními výrazy (RV) a konečnými automaty (KA).

<a id="algo-rg-to-ka"></a>
!!! Algorithm "Regulární gramatika → Konečný automat"

    ### Regulární gramatika → Konečný automat {#algo-rg-to-ka}

    1. Pro každý neterminál vytvoříme nekoncový stav v automatu.
    2. Vytvoříme jeden nový koncový stav $K$.
    3. Stav odpovídající počátečnímu neterminálu bude počáteční stav automatu.
    4. Je-li v gramatice u počátečního neterminálu $\varepsilon$-pravidlo, pak počáteční stav bude též koncový.
    5. Pro pravidla tvaru $A \to aB$ přidáme přechod ze stavu $A$ na symbol $a$ do stavu $B$.
    6. Pro pravidla tvaru $A \to a$ přidáme přechod ze stavu $A$ na symbol $a$ do koncového stavu $K$.

<a id="algo-ka-to-rg"></a>
!!! Algorithm "Konečný automat → Regulární gramatika"

    ### Konečný automat → Regulární gramatika {#algo-ka-to-rg}

    1. Pro každý stav vytvoříme v gramatice jeden neterminál.
    2. Neterminál odpovídající počátečnímu stavu bude počáteční neterminál gramatiky.
    3. Pro přechody typu $B \in \delta(A, a)$ (kde $B$ je nekoncový stav) přidáme do gramatiky pravidlo $A \to aB$.
    4. Pro přechody typu $B \in \delta(A, a)$ (kde $B$ je koncový stav) přidáme do gramatiky pravidla $A \to aB \mid a$.
    5. Pokud je počáteční stav zároveň koncový, k počátečnímu neterminálu přidáme $\varepsilon$-pravidlo. Pokud se počáteční neterminál vyskytuje na pravé straně pravidel, musíme gramatiku upravit (vytvořením nového počátečního neterminálu).

<a id="algo-rv-to-ka"></a>
!!! Algorithm "Regulární výraz → Konečný automat"

    ### Regulární výraz → Konečný automat {#algo-rv-to-ka}

    Existují tři základní metody:

    1.  **Metoda sousedů:**
        *   Očíslujeme symboly v RV.
        *   Určíme množiny počátečních symbolů ($Z$), koncových symbolů ($F$) a sousedů ($P$).
        *   Sestrojíme automat, kde stavy odpovídají očíslovaným symbolům + počáteční stav $q_0$. Přechody konstruujeme na základě množin $Z$ a $P$.
        *   Výsledkem je obecně homogenní NKA (bez $\varepsilon$-přechodů).

    2.  **Metoda derivací:**
        *   Původní RV prohlásíme za počáteční stav.
        *   Derivujeme výrazy podle symbolů abecedy. Výsledky derivací (po úpravě/zjednodušení) tvoří nové stavy.
        *   Pokud $\varepsilon \in h(V)$, je stav $V$ koncový.
        *   Výsledkem je úplně určený DKA (nemusí být minimální).

    3.  **Metoda postupné konstrukce:**
        *   Sestavíme elementární automaty pro $\varepsilon, \emptyset, a$.
        *   Skládáme je pomocí operací sjednocení, zřetězení a iterace (viz skládání automatů).
        *   Výsledkem je NKA s $\varepsilon$-přechody.

<a id="algo-ka-to-rv"></a>
!!! Algorithm "Konečný automat → Regulární výraz"

    ### Konečný automat → Regulární výraz {#algo-ka-to-rv}

    Existují tři základní metody:

    1.  **Metoda regulárních rovnic – odchozí přechody:**
        *   Sestavíme soustavu pravých regulárních rovnic ($A = aB + \dots$).
        *   Řešíme pro neznámou odpovídající počátečnímu stavu.

    2.  **Metoda regulárních rovnic – příchozí přechody:**
        *   Sestavíme soustavu levých regulárních rovnic.
        *   Řešíme pro neznámé odpovídající koncovým stavům a výsledky sjednotíme.

    3.  **Metoda eliminace stavů:**
        *   Upravíme automat tak, aby měl jeden počáteční a jeden koncový stav (pomocí $\varepsilon$-přechodů).
        *   Postupně eliminujeme stavy a nahrazujeme cesty regulárními výrazy na hranách.
        *   Výsledný výraz je na hraně mezi počátečním a koncovým stavem.

<a id="algo-rg-to-rv"></a>
!!! Algorithm "Regulární gramatika → Regulární výraz"

    ### Regulární gramatika → Regulární výraz {#algo-rg-to-rv}

    1.  **Pomocí metody regulárních rovnic:**
        *   Vytvoříme soustavu pravých regulárních rovnic z pravidel gramatiky (nahradíme $\to$ za $=$ a $\mid$ za $+$).
    2.  **Pomocí metody eliminace neterminálních symbolů:**
        *   Podobná eliminaci stavů u KA. Postupně odstraňujeme neterminály a nahrazujeme je v pravidlech regulárními výrazy.

<a id="algo-rv-to-rg"></a>
!!! Algorithm "Regulární výraz → Regulární gramatika"

    ### Regulární výraz → Regulární gramatika {#algo-rv-to-rg}

    1.  **Pomocí metody derivací:**
        *   Podobně jako u převodu na KA, ale místo stavů vytváříme neterminály a pravidla tvaru $V \to aV'$.
    2.  **Pomocí metody postupné konstrukce:**
        *   Sestavíme elementární gramatiky.
        *   Skládáme je pomocí algoritmů pro sjednocení, součin a iteraci gramatik.

!!! Implication "Tip pro zjednodušení práce"
    Práci s převody si můžeme také „ulehčit“ následovně:

    *   u převodu RG $\to$ (KA nebo RV) odstraníme zbytečné symboly z gramatiky,
    *   u převodu KA $\to$ (RG nebo RV) odstraníme nedosažitelné a zbytečné stavy z automatu,
    *   u převodu RV $\to$ (KA nebo RG) si regulární výraz případně zjednodušíme.