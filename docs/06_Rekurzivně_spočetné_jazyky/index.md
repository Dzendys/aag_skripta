# 6 Rekurzivně spočetné jazyky

Formální jazyk je **rekurzivně spočetný** právě tehdy, když jej lze generovat neomezenou gramatikou. Pro rekurzivně spočetné jazyky dále platí, že je lze:

*   **přijmout** (ne)deterministickým Turingovým strojem.

Tato třída jazyků **je uzavřená** pro operace: sjednocení, průnik, zřetězení a iterace. **Není uzavřená** pro operace: doplněk a rozdíl.

### Rekurzivní jazyky

Existuje ještě jedna množina formálních jazyků, která obsahuje všechny jazyky kontextové, ale neobsahuje všechny jazyky rekurzivně spočetné. Této množině se říká **rekurzivní jazyky**. Třída rekurzivních jazyků je **uzavřená pro všechny** námi definované operace (sjednocení, průnik, rozdíl, doplněk, zřetězení, iterace).

<a id="def-rekurzivni-jazyk"></a>
!!! Definition "[Definice (Rekurzivní jazyk)](#def-rekurzivni-jazyk)"

    ### Rekurzivní jazyk {#def-rekurzivni-jazyk}

    Formální jazyk je **rekurzivní** právě tehdy, když jej lze **rozhodovat** nějakým Turingovým strojem.
    
    Říkáme, že Turingův stroj $R$ **rozhoduje** jazyk $L$, jestliže jej přijímá (tj. $L(R) = L$) a výpočet se pro každé slovo zastaví. Tedy pro řetězec $w \notin L$ se Turingův stroj **nesmí zacyklit**.

!!! Implication "Pozorování"
    Jazyk $L$ je rekurzivní právě tehdy, když $L$ a jeho doplněk $\overline{L}$ jsou rekurzivně spočetné jazyky.
