// For counting words, may not work on MacOS
#import "@preview/wordometer:0.1.5": word-count, total-words
#show: word-count.with(exclude: (heading, raw, strike))

// For flowchart
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

// Basically TikZ
#import "@preview/cetz:0.4.2"

// Making the footer for the title page
#set page(footer: context {
  let page = counter(page).get().first()

  if page == 1 {
    grid(
      columns: (1fr, 1fr, 1fr),
      align(left)[*Programování*],
      align(center)[*Leon Kubota, 4.E*],
      align(right)[*Leden 2025*],
    )
  } else {
    align(center)[#page]
  }
},
)

// First page
#v(-1.5cm)
#align(center)[
  #table(
    stroke: none,
    columns: (2cm, 10cm),
    column-gutter: 15pt,
    align: horizon,
    image("images/GyarabLogo.png", width: 100%),
    align(left)[*Gymnázium, Praha 6, Arabská 14 \
    předmět Programování, vyučující Ing. Daniel Kahoun*],
  )
]

#v(0.4fr)
#align(center)[#image("images/logo.png", width: 50%)]
#text(18pt)[#align(center)[*Adess -- umělecky dirigovaný syntetizér zvuku motorů*]]
#v(-0.25cm)
#align(center)[ročníkový projekt]
//#align(center)[#highlight[*_Slova: #total-words / 2000_*]]
#v(0.25cm)
#v(0.5fr)

#set text(
  lang: "cs"
)

#set math.equation(numbering: "(1)")
#set math.cases(gap: 0.75em)

#let code(
  content,
  caption: [],
  //fig
) = {
  set par(justify: false)
  figure(
    block(
      radius: 4pt,
      stroke: 0.05em, //+ rgb("#808080"),
      inset: (x: 6pt, y: 8pt),
      width: 100%,
      clip: false,
      [#align(left)[#content]]
    ),
    caption: [#caption],
    supplement: "Výpis",
    kind: "code"
  )
}

// To have nice figures
#show figure.caption.where(kind: image): it => [
  Obr.
  #context it.counter.display(it.numbering)
  #it.body
]
#show figure.caption.where(kind: table): it => [
  Tab.
  #context it.counter.display(it.numbering)
  #it.body
]
#set figure.caption(separator: [ -- ])

#set par(
  justify: true
)

// Raw code
#set raw(
  tab-size: 4,
  syntaxes: "syntax.sublime-syntax",
  theme: "theme.tmTheme"
)
#show raw: set text(font: "FreeMono")
#show raw.where(block: true): set text(1em / 0.95) // Set ```this``` to some size
#show raw.where(block: false): set text(1em / 0.8) // Set `this` to normal size


#pagebreak()


#table(
  stroke: none,
  columns: (2fr, 3fr),
  image("images/GyarabLogo.png", width: 40%),
  align(right)[#heading(outlined: false)[Gymnázium, Praha 6, Arabská 14]
  tel.: 235 351 708 \
  fax.: 222 262 066 \
  e-mail: ga\@gyarab.cz\
  www.gyarab.cz],
)

#line(stroke: 0.15em + rgb("#808080"), length: 100%)

#heading(outlined: false)[Zadání ročníkového projektu]
#v(0.25cm)
#grid(
  columns: (1fr, 3fr),
  row-gutter: 0.5cm,
  heading(level: 2, outlined: false)[Název:],
  heading(level: 2, outlined: false)[Adess -- umělecky dirigovaný syntetizér zvuků motorů],

  heading(level: 2, outlined: false)[Řešitel:],
  heading(level: 2, outlined: false)[Kubota Leon, 4.E],

  heading(level: 2, outlined: false)[Vedoucí práce:],
  heading(level: 2, outlined: false)[Ing. Daniel Kahoun],

  heading(level: 2, outlined: false)[Datum odevzdání:],
  heading(level: 2, outlined: false)[28. 2. 2026],
)

#heading(level: 2, outlined: false)[Způsob zpracování a kritéria hodnocení:]
Zpracování v požadovaném rozsahu se řídí obecně závaznými pokyny zpracování ročníkových projektů. Řešitel elektronicky odevzdáve stanoveném termínu dokumentaci, prezentaci, poster a další vyžádané přílohy (např. zdrojové kódy, ukázková data). Před obhajobou řešitel odevzdá jeden výtisk stejné dokumentace s podepsaným prohlášením o autorství a jeden poster, neurčí-li vedoucí jinak. Hodnotí se odborné zpracování úlohy, použití návrhových vzorů, prezentace při obhajobě a funkcionalita produktu.

#heading(level: 2, outlined: false)[Popis (povinná část):]
Vytvořte konzolovou aplikaci pro procedurální syntézu zvuků motorů určenou pro film a animaci. Program generuje zvukové vzorky na základě uživatelské konfigurace a klíčových snímků definovaných ve vlastním datovém formátu.

#heading(level: 2, outlined: false)[Upřesnění zadání:]
- Implementace parseru konfiguračních souborů _adess_
- Procedurální generování pole vzorků zvuku motoru
- Práce s klíčovými snímky pro změnu zvuku v čase
- Export _audia_ do standardního formátu _WAV_
- Ovládání aplikace pomocí příkazové řádky (_CLI_)

#heading(level: 2, outlined: false)[Bonus (nepovinná část):]
- Podpora pro různé typy motorů (vrtulové, spalovací)
- Přidání zvukových efektů (např. ozvěna, zkreslení)
- Grafické znázornění generované zvukové vlny v _CLI_
- Možnost reálného náhledu (přehřání) před uložením

#heading(level: 2, outlined: false)[Platforma:]
- C

#v(1fr)

#table(
  columns: (1fr, 1fr, 1fr),
  align: center,
  stroke: none,
  row-gutter: -0.4em,

  [],
  [#line(stroke: (dash: "dashed", paint: rgb("#808080")), length: 92%)],
  [#line(stroke: (dash: "dashed", paint: rgb("#808080")), length: 92%)],

  [],
  [datum podpisu],
  [podpis řešitele],
)

#pagebreak()


#heading(outlined: false)[Anotace]
`Adess` je aplikace přístupná v příkazové řádce, která procedurálně generuje zvuky spalovacích motorů pro využití v animaci a filmu. Generace je plně ovladatelná uživatelem prostřednictvím nastavovacích souborů `adess` ve vlastním "jazyce". V těchto souborech jsou uloženy důležité hodnoty o formátu a charakteristice požadovaného zvuku a klíčové snímky, které určují jeho přeměnu v čase. Hodnoty z těchto souborů jsou načteny do paměti a následovně využity pro procedurální paralelní syntézu zvuků motorů. Výstupem této generace je pole vzorků, které se uloží do souboru `WAVE`. 

#heading(outlined: false)[Abstract]
`Adess` is an application that runs in the terminal, it procedurally generates the sound of combustion engines for use in animation and film production. The generation is fully customizable by the user through `adess` configuration files in a proprietary "language". These files contain important values about the format and characteristics of the desired sound and keyframes, that determine the sounds change through time. The values from these files are loaded into memory and subsequently used for procedural parallel synthetization of engine sounds. The output of this generation is a buffer of samples, which are exported into a `WAVE` file.

#heading(outlined: false)[注釈]
`Adess`はターミナルで動作するアプリケーションで、アニメーションや映画制作に使用するために、燃焼エンジンの音を手続き的に生成します。この生成は、独自の「言語」である`adess`設定ファイルを通じて、ユーザーによって完全にカスタマイズ可能です。これらのファイルには、期待される音のフォーマットと特性、そして時間の経過に伴う音の変化を決定するキーフレームに関する重要な値が含まれています。これらのファイルからの値はメモリにロードされ、その後、エンジン音の手続き的な並列合成に使用されます。この生成の出力は、`WAVE`ファイルにエクスポートされるサンプルのバッファです。

#v(1fr)

#heading(outlined: false)[Čestné prohlášení]
Prohlašuji, že jsem jediným autorem tohoto projektu, všechny citace jsou řádně označené a všechna použitá literatura a další zdroje jsou v práci uvedené. Tímto dle zákona 121/2000 Sb. (tzv. Autorský zákon) ve znění pozdějších předpisů uděluji bezúplatně škole Gymnázium, Praha 6, Arabská 14 oprávnění k výkonu práva na rozmnožování díla (§ 13) a práva na sdělování díla veřejnosti (§ 18) na dobu časově neomezenou a bez omezení územního rozsahu.

#v(1.5cm)

#table(
  columns: (1fr, 1fr, 1fr),
  align: center,
  stroke: none,
  row-gutter: -0.4em,

  [],
  [#line(stroke: (dash: "dashed", paint: rgb("#808080")), length: 92%)],
  [#line(stroke: (dash: "dashed", paint: rgb("#808080")), length: 92%)],

  [],
  [datum podpisu],
  [podpis řešitele],
)

#pagebreak()


#outline()

#set heading(numbering: "1.1.1")
#set page(numbering: "1")

#pagebreak()


= Úvod
Cílem tohoto projektu je vytvořit program, který dokáže na základě uživatelských pokynů generovat zvuk motorů. Cílem není generovat zvuk živě, ale generovat jej pro využití ve filmu a animaci.\

V současnosti se pro tvorbu zvuku motorů využívá nahrávání skutečných motorů a následná digitální manipulace. Tento přístup umožňuje nejvyšší kvalitu zvuku, je však velice náročný a nákladný. @MIX:EngineFXWithPersonalityInPixarsCars\

Rozhodl jsem se zvuk tvořit synteticky, přestože se v současnosti více využívá simluace. Výhodou syntézy je násobně kratší doba obratu a vyšší míra ovládání, uživatel tedy může rychleji a více experimentovat. Tento přístup je také možné značně urychlit paralelizací, jelikož obsahuje mnoho na sobě nezávislých prvků. @GH:EngineSim @IEEE:EngineSoundSynthesis

Aplikace se ovládá skrze nastavovací soubory, ve kterých uživatel charakterizuje vlastnosti motoru, přeměnu hodnot skrze čas a parametry výstupního souboru `WAVE`. Tyto nastavovací soubory jsou zapisovány ve vlastním "jazyce" pomocí párů klíč -- hodnota. Pro generaci zvuku použije uživatel příkaz `adess render` a název scény, aplikace tento soubor vytvoří

/*
Tvorba zvuku motorů pro využití ve animaci je velice složitá, konvenčním způsobem je nahrát zvukové stopy skutečného motoru a pomocí komplexních digitálních manipulací získat finálnú zvuk. Takováto tvorba zvuku je velice časově náročná, umožňuje však precizní úpravu zvuku pro tvorbu působivých výsledků. Tento způsob je však zcela nevyhovující menším studiům či jednotlivcům, kteří nedisponují stovky hodin a neovládají tuto tvůrčí disciplínu. @MIX:EngineFXWithPersonalityInPixarsCars

Druhým postupem je zvukovou stopu generovat, toho lze docílit simulací tlakových vln v motoru nebo syntézou, tedy tvorbou zvuku pomocí matematických algoritmů. V této práci využívám pro generaci zvuku spalovacích motorů syntetický přístup.
*/

#pagebreak()

// Beautiful syntax (I hate this)
#page(footer: context [
  #line(stroke: 0.05em, length: 100%)
  \*U 24 _bitových_ vzorků lze využít i datového typu `int32_t` s nulovým vycpáváním, rozhodl jsem se však v zájmu nižší velikosti výsledného souboru pro komplexnější řešení.]
)[
= Použité technologie
Celý projekt je napsán v programovacím jazyce `C` (konkrétně `C99`) pro jeho výpočetní účinnost a možnost bližšího kontaktu s _hardwarem_. Tento jazyk jsem zvolil také kvůli svému zájmu o studium letectví a kosmonautiky, kde se hojně využívá.\

Pro zkompilování jsem využil `CMake` a běžně používaný _compiler_ `GCC` (_GNU Compiler Collection_). Jedinou nestandardní knihovnou je knihovna `pthreads` (využita pro paralelní procesování). @CMAKE:CMake @GCC:GNUCompilerCollection @POSIX:pthreads

Při psaní zdrojového kódu jsem využil několika nástrojů:\

- `CMake` -- již zmíněný nástroj pro usnadnění kompilace. @CMAKE:CMake
- `Sonic Visualiser` -- nástroj pro analýzu zvuku, umožňuje spektrální i vlnovou analýzu. @CDM:SonicVisualiser
- `Spek` -- jednodušší, zato rychlejší a uživatelsky přívětivější nástroj pro analýzu zvuku. @AK:Spek
- `Valgrind` -- nástroj běžící v příkazové řádce pro analýzu paměti programu za běhu, je velice užitečný pro zamezení únikům paměti. @VG:Valgrind

= Zvuk
Abychom dokázaji zvuk tvořit, je potřeba mu alespoň povrchově porozumět. Jako zvuk označujeme vlnění částic vzduchu. Čím rychleji tyto částice kmitají (jejich frekvence), tím vyšší tón slyšíme; čím větší je amplituda vlnění, tím hlasitější zvuk slyšíme. Jako lidé slyšíme zvuky o frekvencích od $20$ až $20000$ Hz a hlasitosti alespoň $0$ dB. @DOSITS:Loudness

== Digitální zvuk 
Digitální zvuk je ukládán jako pole vzorků, které určují, v jaké poloze se má nacházet oscilátor v reproduktoru.\

V jednotlivých vzorcích je uložena amplituda v určitém čase. Datový typ vzorku se liší podle rozlišení vzorků (anglicky _bit depth_), běžně nabývá hodnot 8, 16, 24 a 32. V Tab. @TAB:Typy[] jsou blíže popsány datové typy vzorků v mé aplikaci.

#figure(
  table(
    stroke: 0.05em,
    columns: (4cm, 4cm),
    table.header(
      [*rozlišení vzorku*], [*použitý datový typ*]
    ),
    [8], [`uint8_t`],
    [16], [`int16_t`],
    [24], [3 $dot$ `uint8_t`\*],
    [32], [`float`],
  ),
  caption: [Datové typy využité pro ukládání vzorků],
) <TAB:Typy>

Vzorkovací frekvence (anglicky _sample rate_) označuje počet vzorků zaznamenaných každou sekundu. Obvykle se používá hodnota $44,1$ kHz, jelikož je dostatečně vysoká pro zaznamenání celého spektra slyšitelného zvuku. Pokud se frekvence, kterou se snažíme zaznamenat, rovná polovině vzorkovací frekvence (takzvaná _Nyquistova_ frekvence), dochází ke ztrátě informací.
]


#pagebreak()

= Ovládání aplikace _Adess_
Aplikace se ovládá skrze příkazy psané v příkazové řádce a nastavovací soubory. V Tab. @TAB:commands[] jsou popsány příkazy dostupné v aplikaci _Adess_.

#figure(
  table(
    stroke: 0.05em,
    columns: (3fr, 2fr, 5fr),
    align: left,
    table.header(
      [*příkaz*], [*přepínače*], [*popis*]
    ),

    [`adess help`], [bez přepínačů], [Zobrazí uživateli možnosti aplikace _Adess_.],
    [`adess make_project`], [`-h`, `-n`, `-d`, `-e`], [Vytvoří adresář projektu a naplní jej soubory.],
    [`adess make_scene`], [`-h`, `-n`, `-d`, `-e`], [Vytvoří soubor scény.],
    [`adess make_engine`], [`-h`, `-n`, `-d`, `-e`], [Vytvoří soubor motoru.],
    [`adess render`], [`-h`, `-n`, `-p`], [Vypočítá zvuk a uloží zvukovou stopu.],
    [`adess guide`], [bez přepínačů], [Zobrazí uživateli podrobnější dokumentaci.],
  ),
  caption: [Přehled příkazů aplikace _Adess_],
) <TAB:commands>

V Tab. @TAB:options[] jsou popsány přepínače.

#figure(
  table(
    stroke: 0.05em,
    columns: (1fr, 1.25fr, 5fr),
    align: left,
    table.header(
      [*přepínač*], [*název*], [*popis*]
    ),

    [`-h`], [_help_], [Zobrazí možnosti příkazu (alternativa `adess help <příkaz>`).],
    [`-n`], [_name_], [Nastaví jméno (projektu, scény, motoru či exportovaného souboru).],
    [`-d`], [_directory_], [Nastaví adresář pro vytvoření (projektu, scény či motoru)],
    [`-e`], [_empty_], [Vytvoří prázdný projekt, scénu či motor (bez továrních hodnot).],
    [`-p`], [_preview_], [Přeskočí _post-processing_ fázi],
  ),
  caption: [Přehled přepínačů aplikace _Adess_],
) <TAB:options>

== Parsování příkazů
Při spuštění načte aplikace argumenty do dvojitého ukazatele typu `char` (v kódu: `**argv`). Řetězec znaků na indexu 1 je porovnán s názvy příkazů, a pokud dojde ke shodě, příkaz je spuštěn pomocí funkce `execute`. Ta zavolá požadovanou implementaci příkazu pomocí ukazatele funkce. Kontrola vstupu je provedena na úrovni jednotlivých příkazů v příslušné funkci.\

Parsování přepínačů je komplexnější, jelikož některé přepínače požadují hodnotu (implementovány jsou i parametry s několika hodnotami, ty však nejsou využity). K zjišťování vlastností přepínaču je využit tento řetězec: `"hn.d.ep"`. Jednotlivá písmena představují možné přepínače, pokud se za písmenem vyskytuje znak `'.'`, jde o parametr s hodnotou (několik hodnot je označeno znakem `':'`). Aktivní parametry se ukládají do pole `bool g_opts[8]`, jejich hodnoty jsou uloženy v pole řetězců `char *g_vals[8][2]`.\


#pagebreak()


== Nastavovací soubory
Nastavovací soubory aplikace jsou rozděleny do tří kategorií: projektový soubor obsahuje parametry výsledného souboru a informace o adresách jiných souborů; soubor scény obsahuje informace o scénách a soubor motoru obsahuje parametry motoru. Konkrétní hodnoty jsou popsány v kapitole @KAP:NastavovaciSoubory[], nejprve je však popsán syntax těchto souborů.

=== Syntax nastavovacích souborů
Syntax nastavovacích souborů je velice jednoduchý. Jsou podporovány 3 datové typy: celá čísla (`integer`), desetinná čísla (`float`) a řetězce (`string`). Čísla jsou omezeny na nezáporná, ve výpisu @C:syntax[] je ukázka nastavovacího souboru (_Adess_ také podporuje komentáře).

#figure(
  code(
    ```c
    sample_rate = 44100 // Celé číslo, nastavuje vzorkovací frekvenci
    base_volume = 0.05f // Desetinné číslo, nastavuje hlasitost základní stopy 
    engine_path = "engines" // Řetězec, nastavuje cestu k souborům motorů
    ```,
    caption: [Ukázka nastavovacího souboru]
  ),
) <C:syntax>

Pro nastavení klíčových snímků je využit zápis ve výpisu @C:keyframe[].
#figure(
  code(
    ```c
keyframes = {
  // Hodnoty: čas (v sekundách), otáčky (v ot/min) a zátěž (hodnoty 0 až 1)
  2.5f, 900, 0.0f;
  3.5f, 2500, 0.7f;
}
    ```,
    caption: [Ukázka animace pomocí klíčových snímků]
  ),
) <C:keyframe>

=== Proměnné nastavovacích souborů <KAP:NastavovaciSoubory>
Proměnné projektového souboru jsou popsány v Tab. @TAB:project[].

#figure(
  table(
    stroke: 0.05em,
    columns: (1.5fr, 1.5fr, 5fr),
    align: left,
    table.header(
      [*Název*], [*Typ*], [*Popis*]
    ),

    [`sample_rate`], [`integer`], [Vzorkovací frekvence výsledného souboru.],
    [`bit_depth`], [`integer`], [Rozlišení vzorku (_8_, _16_, _24_ či _32 bitů_).],
    [`engine_path`], [`string`], [Adresa adresáře obsahující soubory motorů.],
    [`scene_path`], [`string`], [Adresa adresáře obsahující soubory scén.],
    [`output_path`], [`string`], [Adresa adresáře obsahující výsledné soubory.],
    [`seed`], [`integer`], [Počáteční hodnota generátoru náhodných čísel.],
  ),
  caption: [Hodnoty v projektovém souboru],
) <TAB:project>

Soubory scén obsahují informaci o scéně. Možné hodnoty jsou zapsány v Tab. @TAB:scene[].

#figure(
  table(
    stroke: 0.05em,
    columns: (1.5fr, 1.5fr, 5fr),
    align: left,
    table.header(
      [*Název*], [*Typ*], [*Popis*]
    ),

    [`length`], [`float`], [Délka scény v sekundách.],
    [`engine`], [`string`], [Název motoru použitého ve scéně.],
    [`keyframes`], [`keyframe`], [Klíčové snímky obsahující informace o času, okamžitých otáčkách a okamžité zátěži.], 
  ),
  caption: [Hodnoty v souboru scén]
) <TAB:scene>


#pagebreak()


Nejvíce parametrů obsahuje soubor motoru, jsou popsány v Tab. @TAB:engine[].

#figure(
  table(
    stroke: 0.05em,
    columns: (5.05fr, 1.45fr, 5fr),
    align: left,
    table.header(
      [*Název*], [*Typ*], [*Popis*]
    ),

    [`stroke`], [`integer`], [počet dob v jednom cyklu],
    [`cylinder_count`], [`integer`], [počet válců],
    [`idle_rpm`], [`integer`], [otáčky ve volnoběhu], 
    [`max_rpm`], [`integer`], [maximální otáčky], 
    [`valvetrain_timing_offset`], [`float`], [časový posun výfukových ventilů], 

    [`low_frequency_noise_frequency`], [`float`], [frekvence nízkofrekvenčního šumu],
    [`low_frequency_noise_falloff`], [`integer`], [pokles nízkofrekvenčního šumu],
    [`low_frequency_noise_strength`], [`float`], [síla nízkofrekvenčního šumu],

    [`harmonics`], [`integer`], [počet harmonických frekvencí],

    [`base_volume`], [`float`], [hlasitost základní zvukové stopy],
    [`valvetrain_volume`], [`float`], [hlasitost zvuku ventilů],

    [`minimum_volume`], [`float`], [minimální hlasitost],
    [`rpm_volume_multiplier`], [`float`], [otáčkový násobitel hlasitosti],
    [`load_volume_multiplier`], [`float`], [zátěžový násobitel hlasitosti],
    
    [`minimum_noise`], [`float`], [minimální šum],
    [`load_noise_multiplier`], [`float`], [zátěžový násobitel šumu],
  ),
  caption: [Hodnoty v souboru scén]
) <TAB:engine>

Tyto soubory jsou při zavolání příkazu `adess render` načteny do paměti a zpracovány, výsledný soubor bude uložen do adresáře určeného hodnotou `output_path` v projektovém souboru.

=== Parsování nastavovacích souborů <KAP:Parse>
Parsování nastavovacích souborů je rozděleno do dvou částí: nejprve je zkontrolován syntax, existence jednotlivých funkcí a jejich typ; následně je možné načíst hodnotu proměnné ze souboru bez kontrol.\

Parser začne na začátku řádku, postupuje skrze něj pomocí aritmetiky ukazatelů (anglicky _pointer arithmetic_). Pokud nalezne na chybu, ukončí program a zobrazí zprávu:\
#align(center)[``` fatal: [VW-1.9-tdi.adess:11]: incorrect type, integer expected ```]


#pagebreak()


= _Renderování_ zvuku
Uživatel pomocí příkazu `adess render` se jménem scény jako argument spustí několikafázový proces _renderování_. Ten je podrobně popsán v následujících podkapitolách.

== Struktura _renderovacího_ procesu
_Renderovací_ proces je vysoce optimalizován a paralelizován, jeho struktura je zaznamenána v grafu @GRP:Pipeline[].

#figure(
  cetz.canvas({
    import cetz.draw: *
    circle((0, 1.25), radius: 0.01cm, stroke: white)
    // The thing on the left
    content((-9, 1), "I.")
    content((-9, -1), "II.")
    content((-9, -3), "III.")
    content((-9, -5), "IV.")
    content((-9, -7), "V.")
    content((-9, -9), "VI.")

    set-style(mark: (end: ">"))

    // Layer 1 - načtení dat
    content((0, 1), "načtení dat", frame: "rect", padding: 0.2cm)
    line((0, 0.5), (0, 0), (-6, 0), (-6, -0.5))
    line((-2, 0), (-2, -0.5))
    line((2, 0), (2, -0.5))
    line((0, 0), (6, 0), (6, -0.5))

    // Layer 2 - interpolace, hnědý šum, nízkofrekvenční šum
    content((-6, -1), "nízkofrekvenční šum", frame: "rect", padding: 0.2cm)
    content((-2, -1), "stabilní hnědý šum", frame: "rect", padding: 0.2cm)
    content(( 2, -1), "interpolace", frame: "rect", padding: 0.2cm)
    content(( 6, -1), "růžový šum", frame: "rect", padding: 0.2cm)
    line((-6, -1.5), (-6, -2), (-2, -2), (-2, -2.5))
    line((-2, -1.5), (-2, -2.5))
    line(( 1.9, -1.5), (1.9, -2), (-2, -2), (-2, -2.5))
    line(( 2.1, -1.5), (2.1, -2.5))
    line(( 6, -1.5), (6, -2), (2.1, -2), (2.1, -2.5))

    // Layer 3 - základní stopa, ventily
    content((-2, -3), "základní stopa", frame: "rect", padding: 0.2cm)
    content(( 2, -3), "klapání ventilů", frame: "rect", padding: 0.2cm)
    line((-2, -3.5), (-2, -4), (-4, -4), (-4, -4.5))
    line((2, -3.5), (2, -4), (-4, -4), (-4, -4.5))

    // Layer 4 - kombinace
    content((-4, -5), "kombinace", frame: "rect", padding: 0.2cm)
    line((-4, -5.5), (-4, -6.5))

    // Layer 5 - post processing 
    line((-4, -7.5), (-4, -8.5))
    content((-4, -7), [_post processing_], frame: "rect", padding: 0.2cm)

    content((2, -4.4), text(size: 0.8em)[paralelní podprocesy], padding: 0.2cm)
    line((-2.5, -6.9), (-0.25, -6.9), (-0.25, -5), (0.25, -5))
    line((-0.25, -5), (-0.25, -6), (0.25, -6))
    line((-0.25, -5), (-0.25, -7), (0.25, -7))
    line((-0.25, -5), (-0.25, -8), (0.25, -8))
    // Sublayer - paralell
    content((2, -5), "1. tónový posun", frame: "rect", padding: 0.2cm)
    content((2, -6), "2. tónový posun", frame: "rect", padding: 0.2cm)
    content((2, -7), "3. tónový posun", frame: "rect", padding: 0.2cm)
    content((2, -8), "4. tónový posun", frame: "rect", padding: 0.2cm)
    line((3.75, -5), (4.5, -5), (4.5, -8.65), (-0.5, -8.65), (-0.5, -7.1), (-2.5, -7.1))
    line((3.75, -6), (4.5, -6), (4.5, -8.65), (-0.5, -8.65), (-0.5, -7.1), (-2.5, -7.1))
    line((3.75, -7), (4.5, -7), (4.5, -8.65), (-0.5, -8.65), (-0.5, -7.1), (-2.5, -7.1))
    line((3.75, -8), (4.5, -8), (4.5, -8.65), (-0.5, -8.65), (-0.5, -7.1), (-2.5, -7.1))

    // Layer 4 - zápis 
    content((-4, -9), "zápis do souboru", frame: "rect", padding: 0.2cm)

    circle((0, -9.75), radius: 0.01cm, stroke: white)
  }),
  caption: [Struktura _renderovacího_ procesu]
) <GRP:Pipeline>

Každý blok v tomto grafu značí paralelně běžící proces. Tyto procesy jsou vykonávány ve fázích (značeny římským číslem vlevo). Využití paměti programu je zobrazeno v grafu @GRP:Memory[].

//#v(1fr)

#figure(
  cetz.canvas({
    import cetz.draw: *

    // Separators
    let h = 5
    let a = -8.25
    let i = 0
    while i < 5 {
      a += 2.75
      line((a, 0), (a, h))
      i += 1
      if i == 1 { content((a - (2.75 / 2), h), "I.") }
      if i == 2 { content((a - (2.75 / 2), h), "II.") }
      if i == 3 { content((a - (2.75 / 2), h), "III.") }
      if i == 4 { content((a - (2.75 / 2), h), "IV.") }
      if i == 5 { content((a - (2.75 / 2), h), "V.") }
    }
    content((a - (2.75 / 2) + 2.75, h), "VI.")

    // I.
    content((-7, 0.25), "vstupní data") // end: write
    rect((-8.25, 0), (8 - 2.5, 0.5))

    // II.
    content((-7 + 2.75, 0.25 + 0.55), "hnědý šum") // end: write
    rect((-8.25 + 2.75, 0.6), (8 - 2.5, 1.1))
    content((-7 + 2.75, 0.25 + 1.2), "růžový šum") // end: combine
    rect((-8.25 + 2.75, 1.2), (8 - 2.5 - 5.5, 1.7))
    content((-7 + 2.75, 0.25 + 1.8), "nízkofr. šum") // end: combine
    rect((-8.25 + 2.75, 1.8), (8 - 2.5 - 5.5, 1.8 + 0.5))

    // III.
    content((-7 + 5.5, 2.6), "základní stopa")
    rect((-8.25 + 5.5, 2.4), (8 - 2.5 - 5.5, 2.4 + 0.5))
    content((-7 + 5.5, 3.2), "klapání ventilů")
    rect((-8.25 + 5.5, 3), (8 - 2.5 - 5.5, 3 + 0.5))

    // IV.
    line((8-2.5-5.5, 1.45), (8-2.5-5.5+1.425 - 1, 1.45), (8-2.5-5.5+1.425 - 1, 3.6), mark: (end: ">"))
    line((8-2.5-5.5, 1.45 + 0.6), (8-2.5-5.5+1.425 - 1, 1.45 + 0.6))
    line((8-2.5-5.5, 1.45 + 1.2), (8-2.5-5.5+1.425 - 1, 1.45 + 1.2))
    line((8-2.5-5.5, 1.45 + 1.8), (8-2.5-5.5+1.425 - 1, 1.45 + 1.8))

    content((-7 + 5.5 + 2.75, 3.8), "komb. stopa")
    rect((-8.25 + 5.5 + 2.75, 3.6), (8.25, 3.6 + 0.5))

    // V.
    line((8-2.5-5.5 + 4.75, 1.45), (8-2.5-5.5+1.425 + 3.75, 1.45), (8-2.5-5.5+1.425 + 3.75, 3.6), mark: (end: ">"))
    line((8-2.5-5.5 + 4.75, 1.45 + 0.6), (8-2.5-5.5+1.425 + 3.75, 1.45 + 0.6))
    line((8-2.5-5.5 + 4.75, 1.45 + 1.2), (8-2.5-5.5+1.425 + 3.75, 1.45 + 1.2))
    line((8-2.5-5.5 + 4.75, 1.45 + 1.8), (8-2.5-5.5+1.425 + 3.75, 1.45 + 1.8))

    content((-7 + 11 - 0.2, 3.2), "1. tón. pos.")
    rect((-8.25 + 11, 3), (-8.25 + 5.5 + 2.75 + 4.75, 3 + 0.5))
    content((-7 + 11 - 0.2, 2.6), "2. tón. pos.")
    rect((-8.25 + 11, 2.4), (-8.25 + 5.5 + 2.75 + 4.75, 2.4 + 0.5))
    content((-7 + 11 - 0.2, 0.25 + 1.2), "3. tón. pos.") // end: combine
    rect((-8.25 + 11, 1.8), (-8.25 + 5.5 + 2.75 + 4.75, 1.8 + 0.5))
    content((-7 + 11 - 0.2, 0.25 + 1.8), "4. tón. pos.") // end: combine
    rect((-8.25 + 11, 1.2), (-8.25 + 5.5 + 2.75 + 4.75, 1.2 + 0.5))

    // VI.
    line((8-2.5-5.5 + 5.5, 0.25), (8-2.5-5.5+1.425 + 4.5, 0.25), (8-2.5-5.5+1.425 + 4.5, 3.6), mark: (end: ">"))
    line((8-2.5-5.5 + 5.5, 0.25 + 0.55), (8-2.5-5.5+1.425 + 4.5, 0.25 + 0.55))
  }),
  caption: [Spotřeba paměti při _renderování_]
) <GRP:Memory>

#pagebreak()

== Předvýpočetní fáze
V této fázi se předvypočítají důležitá pole pro následující fáze. Tyto výpočty probíhají paralelně.

=== Interpolace klíčových snímků a z nich plynoucích hodnot
První vlákno lineárně interpoluje klíčové snímky pomocí rovnice (@RV:interpolace[]), výstupem je pole frekvencí, pole otáček, pole fází, pole zátěže a pole násobitelů nízkofrekvenčního šumu.
$ h = h_0 + (t - t_0) dot (h_1 - h_0) / (t_1 - t_0) $ <RV:interpolace>
$h$ je okamžitá hodnota, $h_0$ a $h_1$ jsou hodnoty předchozího a následujícího klíčového snímku\
$t$ je čas, $t_0$ a $t_1$ jsou časy předchozího a následujícího klíčového snímku\

Otáčky jsou vypočítány pomocí otáčkové rovnice (@RV:otacky[]).
$ o t = (f dot 60) / n \/ v $ <RV:otacky>
$o t$ jsou otáčky [ot $dot$ s#super[-1]]\
$f$ je frekvence [Hz]\
$n$ je inverzní počet pracovních dob za sekundu (2 pro čtyřdobé motory a 1 pro dvoudobé)\
$v$ je počet válců

Fázi vypočítáme pomocí rovnice (@RV:faze[]), která je se vypočítá pomocí kódu ve výpisu @C:Phase[].
$ phi_n = sum^(n-1)_(i = 0) tau dot f[i] dot Delta t $ <RV:faze>

#figure(
  code(
    ```c
    double phase = 0; // Musí být double, float neposkytuje dostatečnou přesnost

    while (i < scene->sampleCount) {
      phase += TAU * frequencyBuffer[i] * timeStep;
      phaseBuffer[i] = phase;
      i++;
    }
    ```,
    caption: [Výpočet fáze],
  )
) <C:Phase>

Násobitel nízkofrekvenčního šumu vypočítáme pomocí rovnice (@RV:nasobitelSumu[]).
$ n = s dot ((-o t^2 - 2 dot o t dot o t_v) / p - (o t_v) / p + 1) $ <RV:nasobitelSumu>

$n$ je násobitel nízkofrekvenčního šumu\
$s$ je síla šumu\
$o t$ a $o t_v$ jsou okamžité otáčky a otáčky ve volnoběhu\
$p$ je pokles (vzdálenost od volnoběhu ve které je šum nulový, v otáčkách)

=== Generace stabilního hnědého šumu
Hnědý šum je tvořen Brownovým pohybem, lze získat integrováním bílého šumu. V aplikaci je využit jako obecný zdroj náhodnosti ve většině funkcí, jeho generace je ve výpisu @C:BrownNoise[]. @WIKI:BrownianNoise\

Pro generaci náhodných čísel je využit 32 _bitový_ `Xorshift`, díky tomuto algoritmu jsou náhodná čísla generována velice rychle a zároveň opakovatelně (dle počáteční hodnoty proměnné `state`). @WIKI:Xorshift

#figure(
  code(
    ```c
    while (i < scene->sampleCount) {
      // Implementace algoritmu Xorshift ve 32-bitové verzi
      *state ^= *state << 13;
      *state ^= *state >> 17;
      *state ^= *state <<  5;

      // Omezení na hodnoty -1.0 až 1.0
      lastBrown += ((*state / (double) UINT32_MAX) * 2.0f - 1.0f) * 0.02f;
      if (lastBrown >  1.0f) lastBrown =  1.0f;
      if (lastBrown < -1.0f) lastBrown = -1.0f;

      stableBrownNoiseBuffer[i] = lastBrown;

      i++;
    }
    ```,
    caption: [Generace hnědého šumu],
  )
) <C:BrownNoise>

Hodnoty jsou dále stabilizovány a vyhlazeny pomocí vážení vzorků dle Gaussova rozdělení.

=== Generace růžového šumu
Tento šum je využit při generaci zvuku klapání ventilů, je velmi podobný bílému šumu, působí však přirozeněji a méně uměle. @RRT:PinkNoise

Pro generaci růžového šumu jsem zvolil _Voss-McCartneyův_ algoritmus, opět s použitím 32 bitového _bitového_ `Xorshift` algortmu, který je však ve výpisu @C:PinkNoise[] vynechán.
#figure(
  code(
    ```C
    while (i < scene->sampleCount) {
      // Implementace algoritmu Xorshift vynechána, výstupem je `randomFloat`
      // Generace růžového šumu pomocí Voss-McCartenova algoritmu s 32 iteracemi

      sum = 0.0f;
      for (n = 0; n < 31; n++) {
        pinkBuffer[n] = (pinkBuffer[n] + randomFloat) * 0.5f;
        sum += pinkBuffer[n];
      }
      pinkNoiseBuffer[i] = sum * 0.03125f; // Výpočet průměrné hodnoty

      i++;
    }
    ```,
    caption: [Generace růžového šumu],
  )
) <C:PinkNoise>

=== Generace nízkofrekvenčního šumu
Nízkofrekvenční šum je využit při generaci základního zvuku motoru ve volnoběhu.

#pagebreak()


== Výpočetní fáze
V této fázi jsou paralelně vypočteny vzorky základní a ventilové zvukové stopy.

=== Základní zvuková stopa
Tato stopa odpovídá zvuku spalování v motoru. Vzorky stopy jsou vypočítány pomocí předvypočtené fáze, výsledná zvuková stopa je zachycena ve spektogramu @OBR:spek[].

#figure(
  image("images/base.png", width: 60%),
  caption: [Spektogram základní zvukové stopy \[`Spek`\]],
) <OBR:spek>

=== Zvuk klapání ventilů
Zvuk klapání ventilů je pro celkový zvuk motoru překvapivě důležitý, zejména v nízkých otáčkách. Pro výpočet zvuku ventilů je nutno znát časy, kdy je vačková hřídel v kontaktu s ventily.\

Každý válec má sací a výfukový ventil, každý z nich je otevřen jednu dobu každé dvě otáčky. Frekvenci otevření sacího ventilu lze vypočítat pomocí rovnice (@RV:ventil[]).

$ f_s = ((o t) / 2 dot v ) / 8 $ <RV:ventil>
$f_s$ je frekvence otevírání sacího ventilu [Hz]\
$o t$ jsou otáčky motoru [ot $dot$ s#super[-1]]\
$v$ je počet válců\

Abychom z této frekvence získali zvukovou stopu, využijeme modulace. Nejprve je zapotřebí přeměnit frekvenci na pulzy pomocí rovnice (@RV:pulzy[]).

$ n = 10 dot abs(sin(phi_s + 0,1 dot p)) - 9 $ <RV:pulzy>
$n$ je momentální hodnota vzorku modulační vlny\
$phi$ je fáze frekvence otevírání sacího ventilu\
$p$ je momentální hodnota růžového šumu\

Tuto pulzovou vlnu posuneme o uživatelem zadanou hodnotu `valvetrain_timing_offset`, čímž vytvoříme pulzovou vlnu výfukových ventilů. Tyto vlny sečteme. Jako nosnou vlnu využijeme pilovou vlnu, ta je generována pomocí kódu ve výpisu @C:SawtoothWave[].

#figure(
  code(
    ```C
    valvetrainBuffer[i] = 2.0f * (fmod(phaseBuffer[i] * 2.0f, TAU) / TAU) - 1.0f;
    ```,
    caption: [Generace pilové vlny]
  )
) <C:SawtoothWave>

Po modulaci nosné pilové vlny pulzovou vlnou získáme zvukovou stopu, která mimikuje klapání ventilů v motoru. 

#pagebreak()



#page(footer: context [
  #line(stroke: 0.05em, length: 100%)
  \*Použití přepínače `-p` vede v některých případech k lepšímu výslednému zvuku.
])[
== Kombinační fáze
V této fázi jsou zkombinovány stopy z minulé fáze na základě požadavků uživatele (`base_volume` a `valvetrain_volume`). Tato fáze je velice rychlá, jde pouze o násobení vzorků jejich hlasitostí a následné sečtení.
== _Post-processing_ fáze
Tato část je časově nejnáročnější, uživatel ji může přeskočit pomocí přepínače `-p` (_preview_)\*. Cílem je vyplnit vyšší frekvence, čehož je docíleno pomocí tónového posunu celé zvukové stopy.

=== _Fourierova_ transformace
K tónovému posunu je třeba zvýšit frekvenci vlny, frekvenci získáme pomocí _Fourierovy_ transformace (viz rovnice @RV:fourier[]). @WIKI:Fourier

$ hat(f)(xi) = integral^infinity_(-infinity) f(x) dot e^(-i 2 pi xi x) dot delta x, quad forall xi in RR $ <RV:fourier>

K jejímu výpočtu byl využit _Cooley-Tukeyovský_ urychlený algoritmus, který využívá komplexních čísel a rekurze. Má implementace tohoto algoritmu je ve výpisu @C:fourier[]. @WU:FFT

#figure(
  code(
    ```C
    void fft(complex float *input, uint64_t n, complex float *temp) {
      // Přeskočena deklarace proměnných

      if (n > 1) {
        for (k = 0; k < (n / 2); k++) {
          even[k] = input[2 * k];
          odd[k] = input[2 * k + 1];
        }

        // Rekurze
        fft(even, n / 2, input);
        fft(odd, n / 2, input);

        // Výpočet FFT
        for (m = 0; m < (n / 2); m++) {
          w = cos(TAU * m / (float) n) - (sin(TAU * m / (float) n) * I);
          z = w * odd[m];
          input[m] = even[m] + z;
          input[m + (n / 2)] = even[m] - z;
        }
      }
    }
    ```,
    caption: [Adaptace algoritmu rychlého _Fourierova_ algoritmu @WU:FFT]
  )
) <C:fourier>
]

=== Tónový posun
Takto převádět zvukovou stopu do frekvenční dimenze lze pouze v případě, že frekvence zůstane konstantní. V případě, že je frekvence proměnná, je zapotřebí rozdělit zvukovou stopu na malé části, ve kterých je frekvence téměř konstantní. Tyto části (dále okna) se překrývají, aby se po jejich složení zpět mohli roztáhnout mezery mezi nimi (a tak se zvýšila frekvence bez zrychlení zvukové stopy).

=== Potlačení spektrálního přelivu
Okna však z důvodu nesynchronizovaných fází nenavazují a vzniká nežádoucí bzučení (anglicky _spectral leakage_), k omezení tohoto jevu je využito _Hanningovo_ okno (viz rovnice (@RV:Hanning[])), které tyto náhlé přechody vyhlazuje. 
V současnosti se pro synchronizaci fází zkoumá využití umělé inteligence.

$ w_H(n) = cases(0\,5 dot [1 - cos(tau n / N)]\; quad 0 <= n = N - 1 , quad quad quad quad quad quad 0 quad "jinak") $ <RV:Hanning>

Celý tento proces je vykonán čtyřikrát (paralelně), výsledné tónově posunuté vlny jsou zkombinovány, jejich amplitudy jsou s rostoucí frekvencí snižovány.

== Zapisovací fáze
Vzorky je zapotřebí převést do správného datového formátu, to zajišťuje funkce `convert`, která využívá ukazatel typu `void` pro imitaci generičnosti. 8 _bitové_ vzorky jsou tvořeny s využitím bitových operací. Po převodu na správný typ lze začít vepisovat data do binárního souboru `WAV` dle Tab. @TAB:WAV[]. @SAPP:Wave

#figure(table(
  columns: (0.15fr, 1fr, 0.3fr, 2fr),
  stroke: 0.05em,
  align: (left, left, center, left),
  table.header(
    [], [Název], [Délka], [Hodnota]
  ),

  table.cell(
    rowspan: 3,
    align: horizon,
    rotate(-90deg, reflow: true)[`RIFF`],
  ),

  // "Riff" chunk descriptor
  [`ChunkID`], [4], [Řetězec "RIFF" v `ASCII` formátu],
  [`ChunkSize`], [4], [Velikost souboru bez `ChunkID` a `ChunkSize`],
  [`Format`], [4], [Řetězec "WAVE" v `ASCII` formátu],

  table.cell(
    rowspan: 8,
    align: horizon,
    rotate(-90deg, reflow: true)[`fmt`],
  ),

  // "fmt" sub-chunk
  [`Subchunk1ID`], [4], [Obsahuje řetězec "fmt \" (s mezerou) v `ASCII` formátu],
  [`SubchunkSize`], [4], [16 pro `PCM`],
  [`AudioFormat`], [2], [1 pro standardní `PCM`, 3 pro `IEEE` (desetinná čísla)],
  [`NumChannels`], [2], [Počet kanálů (v _adess_ vždy 1)],
  [`SampleRate`], [4], [Vzorkovací frekvence, zadáno uživatelem],
  [`ByteRate`], [4], [`SampleRate*NumChannels*BitsPerSample/8`],
  [`BlockAlign`], [2], [`NumChannels*BitsPerSample/8`],
  [`BitsPerSample`], [2], [Rozlišení vzorku (8, 16, 24 nebo 32)],

  table.cell(
    rowspan: 3,
    align: horizon,
    rotate(-90deg, reflow: true)[`data`],
  ),

  // "data" sub-chunk
  [`Subchunk2ID`], [4], [Řetězec "data" v `ASCII` formátu],
  [`Subchunk2Size`], [4], [`NumSamples*NumChannels*BitsPerSample/8`],
  [`data`], [-], [Samotné vzorky],
),
caption: [Hodnoty v hlavičce souboru `WAV` @SAPP:Wave],
) <TAB:WAV>

Po vepsání této hlavičky následuje zápis vzorků.

#pagebreak()


= Rozšíření a budoucnost projektu
Tento projekt nabízí mnoho možností v rámci rozšíření. Za nejdůležitější z nich považuji podporu operačního systému _Windows_, která je v současnosti možná pouze s použitím _WSL_. Dále se pro urychlení nabízí využití grafické karty. Všechny tyto problémy (a mnoho dalších) lze vyřešit využitím modernějšího programovacího jazyka, za vhodného kandidáta považuji `Odin`, jelikož nabízí schopnost ovládat moderní _hardware_ (`SIMD`, _multithreading_, vlastní alokátory paměti atd.) a má rozsáhlou standardní knihovnu.\

Další možnou cestou pro tento projekt je využití simulace namísto syntézy. Jelikož atmosféru lze v tomto případě považovat za ideální plyn, což znamená, že na sebe vzájemně částice silově nepůsobý. Pohyb částic by tedy mohl být paralelně vypočítáván pomocí grafické karty. Následně by byl v této 3d scéně umístěn digitální mikrofon, který by snímal simulovaný tlak.

= Závěr
Syntetická tvorba zvuku je velice obsáhlé a komplexní téma, je velice obtížné synteticky vytvořit zvuk, který zní organicky a uvěřitelně. Přes značnou komplexitu tohoto témata jsem byl schopen vytvořit program, který ukazuje, že v tomto přístupu pro generaci zvuku je potenciál.\

Díky tomuto projektu jsem měl možnost zkombinovat několik různých disciplín: fyziku (zvuk), inženýrství (pro znalost spalovacích motorů) a samozřejmě programování. Pro dosažení vysoké rychlosti programu jsem se naučil základy jazyka `C` a paralelního programování.\

Tento projekt vedl k značnému rozvinutí mých znalostí ohledně programování a prokázal, že syntetická generace zvuku motorů je možná.


#pagebreak()



= Seznam použitých zdrojů
#set bibliography(title: none)
#bibliography(style: "iso690-numeric-brackets-cs.csl", "zdroje.bib")
