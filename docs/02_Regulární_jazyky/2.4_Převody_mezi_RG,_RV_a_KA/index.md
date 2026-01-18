# 2.4 Převody mezi RG, RV a KA

Tato kapitola shrnuje algoritmické postupy pro převody mezi regulárními gramatikami (RG), regulárními výrazy (RV) a konečnými automaty (KA).

![Převody](../../assets/02/prevody_white.png#only-dark){ width="50%" }
![Převody](../../assets/02/prevody_black.png#only-light){ width="50%" }

!!! Implication "Tip pro zjednodušení práce"
    Práci s převody si můžeme také „ulehčit“ následovně:

    *   u převodu RG $\to$ (KA nebo RV) odstraníme zbytečné symboly z gramatiky,
    *   u převodu KA $\to$ (RG nebo RV) odstraníme nedosažitelné a zbytečné stavy z automatu,
    *   u převodu RV $\to$ (KA nebo RG) si regulární výraz případně zjednodušíme.