// Making the footer for the title page
#set page(footer: context {
  if counter(page).get().first() == 1 {
    grid(
      columns: (1fr, 1fr, 1fr),
      align(left)[*Programování*],
      align(center)[*Leon Kubota, 4.E*],
      align(right)[*Leden 2025*],
    )
  }
},
header: context {
  if counter(page).get().first() == 1 {
    text(18pt)[#align(center)[*GYMNÁZIUM, PRAHA 6, ARABSKÁ 14*]]
  }
}
)

// First page
#v(6cm)
#columns(2, gutter: 1em)[
  #align(center)[#image("images/AdessLogo.png", width: 60%)]
  #colbreak()
  #align(center)[#image("images/GyarabLogo.png", width: 70%)]
]
#text(18pt)[#align(center)[*Adess -- umělecky dirigovaný syntetizér zvuku motorů*]]

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

#pagebreak()


= Úvod
Tvorba zvuku motorů pro využití ve animaci je velice složitá, konvenčním způsobem je nahrát zvukové stopy skutečného motoru a pomocí komplexních digitálních manipulací získat finálnú zvuk. Takováto tvorba zvuku je velice časově náročná, umožňuje však precizní úpravu zvuku pro tvorbu působivých výsledků. Tento způsob je však zcela nevyhovující menším studiům či jednotlivcům, kteří nedisponují stovky hodin a neovládají tuto tvůrčí disciplínu. @MIX:EngineFXWithPersonalityInPixarsCars

Druhým postupem je zvukovou stopu generovat, toho lze docílit simulací tlakových vln v motoru nebo syntézou, tedy tvorbou zvuku pomocí matematických algoritmů. V této práci využívám pro generaci zvuku spalovacích motorů syntetický přístup.



#pagebreak()

= Seznam použitých zdrojů
#set bibliography(title: none)
#bibliography(style: "iso690-numeric-brackets-cs.csl", "zdroje.bib")
