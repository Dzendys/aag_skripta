# 3.1 Bezkontextové gramatiky

<a id="def-bezkontextova-gramatika"></a>
!!! Definition "Definice (Bezkontextová gramatika)"

    ### Bezkontextová gramatika {#def-bezkontextova-gramatika}

    **Bezkontextová gramatika** je uspořádaná čtveřice $G = (N, \Sigma, P, S)$, kde pravidla $P$ jsou tvaru:

    $$
    A \to \alpha \quad (\alpha \in (N \cup \Sigma)^*, A \in N)
    $$

!!! Implication "Pozorování"
    **Bezkontextová gramatika** je vždy **zároveň neomezená**. Nemusí být však vždy zároveň **kontextová**, neboť bezkontextová gramatika může být **zkracující**, zatímco kontextová nikoliv.
