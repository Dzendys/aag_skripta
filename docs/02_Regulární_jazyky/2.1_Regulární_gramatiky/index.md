# 2.1 Regulární gramatiky

<a id="def-regularni-gramatika"></a>
!!! Definition "[Regulární gramatika](#def-regularni-gramatika)"

    ### Regulární gramatika {#def-regularni-gramatika}

    **Regulární gramatika** je uspořádaná čtveřice $G = (N, \Sigma, P, S)$, kde pravidla $P$ jsou tvaru:

    $$
    A \to a \quad \text{nebo} \quad A \to aB \quad (a \in \Sigma, A, B \in N)
    $$

    Jedinou **povolenou výjimkou** z těchto pravidel je pravidlo $S \to \varepsilon$. Toto pravidlo se v regulární gramatice může vyskytnout za předpokladu, že počáteční neterminál $S$ se **nevyskytuje na pravé straně** žádného pravidla.

!!! Implication "Vlastnosti"
    Regulární gramatika je **nezkracující** a je vždy **zároveň bezkontextová, kontextová i neomezená**.