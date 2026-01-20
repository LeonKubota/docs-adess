#import "@preview/wordometer:0.1.4": word-count, total-words
#show: word-count

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
header: context {
  if counter(page).get().first() == 1 {
    text(18pt)[#align(center)[*GYMNÁZIUM, PRAHA 6, ARABSKÁ 14*]]
  }
},
)

// First page
#v(5.5cm)
#align(center)[#image("images/1.9TDIModelUkazka.png", width: 40%)]
//#align(center)[#image("images/GyarabLogo.png", width: 20%)]
#text(18pt)[#align(center)[*Adess -- umělecky dirigovaný syntetizér zvuku motorů*]]
#text(18pt)[#align(center)[#highlight[*#total-words / 6000*]]]

#set text(
  lang: "cs"
)

#set math.equation(numbering: "(1)")

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
Vytvořte konzolovou aplikaci pro procedurální syntézu zvuků motorů určenou pro film a animaci. Program generuje zvukové vzorky na základě uživatelské konfigurace a klíčových snímků definovaných ve vlastním datovém formátu _DST_.

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
_Adess_ je aplikace přístupná v příkazové řádce, která procedurálně generuje zvuky spalovacích motorů pro využití v animaci a filmu. Generace je plně ovladatelná uživatelem prostřednictvím nastavovacích souborů _adess_ ve vlastním "jazyce" _DST_ (datová ukládací věc). V těchto souborech jsou uloženy důležité hodnoty o formátu a charakteristice požadovaného zvuku a klíčové snímky, které určují jeho přeměnu v čase. Hodnoty z těchto souborů jsou načteny do paměti a následovně využity pro procedurální paralelní syntézu zvuků motorů. Výstupem této generace je pole vzorků, které se uloží do souboru _WAV_. 

#heading(outlined: false)[Abstract]
Adess is an application that runs in the terminal, it procedurally generates the sound of combustion engines for use in animation and film production. The generation is fully customizable by the user through "adess" configuration files in a proprietary DST "language" (data storage thing). These files contain important values about the format and characteristics of the desired sound and keyframes, that determine the sounds change throughout time. The values from these files are loaded into memory and subsequently used for procedural parallel synthetization of engine sounds. The output of this generation is a buffer of samples, which are exported into a _WAV_ file.

#heading(outlined: false)[Zusammenfassung]

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
Tvorba zvuku motorů pro využití ve animaci je velice složitá, konvenčním způsobem je nahrát zvukové stopy skutečného motoru a pomocí komplexních digitálních manipulací získat finálnú zvuk. Takováto tvorba zvuku je velice časově náročná, umožňuje však precizní úpravu zvuku pro tvorbu působivých výsledků. Tento způsob je však zcela nevyhovující menším studiům či jednotlivcům, kteří nedisponují stovky hodin a neovládají tuto tvůrčí disciplínu. @MIX:EngineFXWithPersonalityInPixarsCars

Druhým postupem je zvukovou stopu generovat, toho lze docílit simulací tlakových vln v motoru nebo syntézou, tedy tvorbou zvuku pomocí matematických algoritmů. V této práci využívám pro generaci zvuku spalovacích motorů syntetický přístup.

#pagebreak()


= Použité technologie
Celý projekt je napsán v programovacím jazyce _C_ (konkrétně _C99_) pro jeho výpočetní účinnost a možnost bližšího kontaktu s _hardwarem_. Tento jazyk jsem zvolil také kvůli svému zájmu o studium letectví a kosmonautiky, kde se hojně využívá pro programování _embedded_ systémů.\

Pro zkompilování jsem využil _CMake_, který podporuje mnoho _compilerů_. Osobně jsem zvolil běžně používaný _compiler_ _GCC_ (_GNU Compiler Collection_). @CMAKE:CMake @GCC:GNUCompilerCollection

Již zmíněné technologie jsou vše, co je nutné pro zkompilování a spuštění projektu (uvažuji, že standardní knihovny uživatel má). Při psaní zdrojového kódu jsem však využil několika dalších nástrojů:\

- _Sonic Visualiser_ -- _open-source_ nástroj pro analýzu zvuku, umožňuje spektrální a vlnovou analýzu. @CDM:SonicVisualiser
- _Spek_ -- jednodušší, zato rychlejší a uživatelsky přívětivější nástroj pro analýzu zvuku. @AK:Spek
- _Valgrind_ -- nástroj běžící v příkazové řádce pro analýzu paměti programu za běhu, je velice užitečný pro zamezení únikům paměti


= Zvuk
Abychom dokázaji zvuk tvořit, je potřeba mu alespoň povrchově porozumět. Jako zvuk označujeme vlnění částic vzduchu. Čím rychleji tyto částice kmitají (jejich frekvence), tím vyšší tón slyšíme. Čím větší je amplituda vlnění, tím hlasitější zvuk slyšíme. Jako lidé slyšíme zvuky o frekvencích od $20$ až $20000$ Hz a hlasitosti alespoň $0$ dB. @DOSITS:Loudness

== Digitální zvuk 
Zvuk je ukládán jako pole vzorků, které určují, v jaké poloze se má nacházet oscilátor v reproduktoru. V tomto projektu je využit formát _WAV_.\

V jednotlivých vzorcích je tedy uložena amplituda v jednotlivém čase. Datový typ vzorku se liší podle rozlišení vzorků (anglicky _bit depth_), běžně nabývá hodnot 8, 16, 24 a 32. Má aplikace dokáže exportovat v těchto _bit ratech_ s využitím datových typů ```c uint8_t``` pro _8-bit_ audio, ```c int16_t``` pro _16-bit_ audio a ```c float``` pro _32-bit_ audio. Pro _24-bit_ audio jsem zvolil zabalení do tří ```c uint8_t``` místo jednoho ```c int32_t``` s nulovým vycpáváním.

_Sample rate_ označuje počet vzorků zaznamenaných na každou sekundu. Obvykle se používá hodnota $44100$, jelikož s ní dokážeme zaznamenat celé spektrum lidsky slyšitelného zvuku. Při příliš nízkých _sample ratech_ dochází k _aliasování_, což je nežádoucí artefakt plynoucí z příliš vysoké frekvence. Tato konkrétní frekvence, při níž dochází k _aliasování_, se nazývá _Nyquistova_. Je rovna polovině _sample ratu_. V mé aplikaci si uživatel může zvolit libovolný _sample rate_.

#pagebreak()

= Příkazy

= Ukládání dat
Data se v _Adess_ ukládají do souborů


#pagebreak()

= Postup _renderování_ zvuku
Uživatel pomocí příkazu `adess render` se jménem scény jako argument spustí několikafázový proces _renderování_. Ten je podrobně popsán v následujících podkapitolách.

== Čtení vstupních dat
Nejprve se otevře soubor projektu a jeho data se po kontrole syntaxe parsují do struktury ```c struct Project```. Poté se toto opakuje se scénou a nakonec se souborem motoru. 

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

Fázi vypočítáme pomocí rovnice (@RV:faze[]).
$ phi_n = sum^(n-1)_(i = 0) tau dot f[i] dot Delta t $ <RV:faze>

V programu vypočítáme rovnici (@RV:faze[]) takto:
```c
double phase = 0; // Musí být double, jelikož float neposkytuje dostatečnou přesnost

while (i < scene->sampleCount) {
  phase += TAU * frequencyBuffer[i] * timeStep;
  phaseBuffer[i] = phase;
  i++;
}
```

Násobitel nízkofrekvenčního šumu vypočítáme pomocí rovnice (@RV:nasobitelSumu[]).
$ n = s dot ((-o t^2 - 2 dot o t dot o t_v) / p - (o t_v) / p + 1) $ <RV:nasobitelSumu>

$n$ je násobitel nízkofrekvenčního šumu\
$s$ je síla šumu\
$o t$ a $o t_v$ jsou okamžité otáčky a otáčky ve volnoběhu\
$p$ je pokles (vzdálenost od volnoběhu ve které je šum nulový, v otáčkách)

=== Generace stabilního hnědého šumu
Hnědý šum je šum, který je tvořen Brownovým pohybem, lze získat integrováním bílého šumu. V aplikaci je využit jako obecný zdroj náhodnosti ve většině funkcí. @WIKI:BrownianNoise\

Pro generaci náhodných čísel je využit _32-bitový_ `Xorshift`, díky tomuto algoritmu jsou náhodná čísla generována velice rychle a zároveň opakovatelně (dle počáteční hodnoty proměnné `state`. @WIKI:Xorshift
```c
while (i < scene->sampleCount) {
  // Implementace algoritmu Xorshift ve 32-bitové verzi
  *state ^= *state << 13;
  *state ^= *state >> 17;
  *state ^= *state << 5;

  // Přepočítání na hodnoty -1.0 až 1.0
  lastBrown += ((*state / (double) UINT32_MAX) * 2.0f - 1.0f) * 0.02f;
  if (lastBrown > 1.0f) lastBrown = 1.0f;
  if (lastBrown < -1.0f) lastBrown = -1.0f;

  stableBrownNoiseBuffer[i] = lastBrown;

  i++;
}
```

Hodnoty jsou dále stabilizovány a vyhlazeny pomocí zprůměrování vzorků dle Gaussova rozdělení. Díky tomuto kroku působí šum přirozeněji. 

=== Generace růžového šumu
Tento šum je využit při generaci zvuku klapání ventilů, je velmi podobný bílému šumu, působí však přirozeněji a méně uměle. @RRT:PinkNoise

Pro generaci růžového šumu jsem zvolil _Voss-McCartneyův_. Pro generaci náhodných čísel byl použit _32-bitový_ `Xorshift`, který však v ukázce Kód: @C:PinkNoise[] není vypsán.
#figure(
  ```C
  while (i < scene->sampleCount) {
    // Implementace algoritmu Xorshift ve 32-bitové verzi
    ...

    // Generace růžového šumu pomocí Voss-McCartenova algoritmu s 32 iteracemi
    sum = 0.0f;
    for (n = 0; n < 31; n++) {
      pinkBuffer[n] = (pinkBuffer[n] + randomFloat) * 0.5f;
      sum += pinkBuffer[n];
    }
    pinkNoiseBuffer[i] = sum * 0.03125f; // Vypočítání průměrné hodnoty

    i++;
}
```
) <C:PinkNoise>

=== Generace nízkofrekvenčního šumu
Nízkofrekvenční šum je využit při generaci základního zvuku motoru v otáčkách blízko otáčkám volnoběhu. Pro jeho generaci je také využit _32-bitový_ `Xorshift`.

#pagebreak()


== Výpočetní fáze
V této fázi jsou paralelně vypočteny vzorky jednotlivých zvukových stop. Konkrétně jde o vzorky základní zvukové stopy motoru a o vzorky zvuku klapání ventilů.

=== Základní zvuková stopa

=== Zvuk klapání ventilů

#pagebreak()


== Kombinační fáze
V této fázi jsou zkombinovány stopy vzorků z minulé fáze na základě požadavků uživatele.

#pagebreak()


== _Post-processing_ fáze

== Zapisovací fáze


#pagebreak()
= Závěr



#pagebreak()

= Seznam použitých zdrojů
#set bibliography(title: none)
#bibliography(style: "iso690-numeric-brackets-cs.csl", "zdroje.bib")
