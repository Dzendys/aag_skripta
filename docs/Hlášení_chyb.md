### Jakékoli problémy můžete nahlásit [**zde**](https://github.com/Dzendys/aag_skripta/issues/new)

---

### Poznámky k hlášení chyb

1. Specifikujte kde (číslo sekce – např. 4.2) a v čem problém spočívá – například: `4.2 – překlep v důkazu věty 4.1`
2. V případě potřeby přidejte jakýkoli relevantní popis
3. Vytvořte issue (nahlášení)

---

### Lokální spuštění pro kontrolu změn před vytvořením pull requestu

1. Stáhněte (git pull) svůj fork do svého počítače
2. Vytvořte novou větev (branch)
3. Proveďte změny
4. Vytvořte virtuální prostředí Pythonu a nainstalujte do něj mkdocs:
```bash
python3 -m venv venv # vytvoří virtuální prostředí Pythonu
source venv/bin/activate # aktivuje ho
pip install mkdocs-material
```
5. Spusťte aplikaci:
```bash
cd {složka vašeho forku obsahující soubor mkdocs.yml}
mkdocs serve
```
6. Otevřete webový prohlížeč a zadejte adresu http://127.0.0.1:8000/

---

### Vytvoření Pull requestu

Chybu můžete opravit i sami pomocí pull requestu:

1. Vytvořte si fork repozitáře
2. Opravte chybu ve svém forku
    - Snažte se prosím u všech svých commitů používat prefix `fix: (zpráva commitu)`
3. Požádejte o sloučení (merge) do větve `master` v repozitáři `Dzendys/aag_skripta`