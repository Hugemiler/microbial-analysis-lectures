# Microbiome analysis lectures

A collection of Quarto / Reveal.js lectures with executable R, equations,
figures and speaker notes. Each lecture keeps its own content and analysis code.
The project supplies shared presentation settings and styling.

## Repository layout

```text
_quarto.yml                     Shared Quarto settings and render targets
shared/
  theme.scss                    Styling used by every lecture
lectures/
  01-pca-pcoa/
    slides.qmd                  Editable lecture source
    R/setup.R                   Lecture data and analysis helpers
    README.md                   Lecture context and data assumptions
templates/
  lecture/                      Starter folder for the next lecture
_output/                        Generated HTML, mirroring lecture folders
_archive/                       Preserved older generated files
```

Only `lectures/**/slides.qmd` is included when rendering the collection.
Templates stay outside that render list. Generated output and caches are ignored
by Git. The `origin` remote points to
[Hugemiler/microbial-analysis-lectures](https://github.com/Hugemiler/microbial-analysis-lectures).

## Current lectures

| Lecture | Source | Rendered slides |
|:--|:--|:--|
| 01 · PCA and PCoA | [Edit](lectures/01-pca-pcoa/slides.qmd) | [Present](_output/lectures/01-pca-pcoa/slides.html) |

The PCA/PCoA lecture uses synthetic three-month-old infant communities, direct
SVD and eigenanalysis, and a comparison of Euclidean and Bray–Curtis distances.
See its [lecture notes](lectures/01-pca-pcoa/README.md) for data assumptions.

## Preview a lecture

From the project root, open the VS Code terminal and run:

```sh
quarto preview lectures/01-pca-pcoa/slides.qmd
```

Keep the terminal running. Save the lecture source to rebuild and refresh the
browser. Stop with **Ctrl+C**. If you still have the old preview running from
before this reorganization, stop it and start the command above.

Edit the `.qmd` file rather than the generated HTML. In the browser, use arrow
keys to navigate, **F** for fullscreen, **S** for speaker view, and **O** for the
overview. Speaker view depends on browser permissions. MathJax may require
network access. R code runs at render time rather than during presentation.

## Render one lecture or the collection

```sh
# One lecture
quarto render lectures/01-pca-pcoa/slides.qmd

# All lectures
quarto render
```

The first lecture renders to `_output/lectures/01-pca-pcoa/slides.html`.
The output folder mirrors the source folders, keeping lecture outputs separate.

## Add another lecture

Copy the starter folder from the project root:

```sh
cp -R templates/lecture lectures/02-your-topic
```

1. Edit the title and slides in `lectures/02-your-topic/slides.qmd`.
2. Put its R helpers in `R/setup.R` inside that lecture folder.
3. Add `data/` and `images/` inside the lecture folder when needed. Record data
   sources and package requirements in its README.
4. Add the lecture to the catalog above.
5. Preview it with `quarto preview lectures/02-your-topic/slides.qmd`.

No change to `_quarto.yml` is needed to add a lecture. Code executes from each
lecture's directory, so `source("R/setup.R")` and `read.csv("data/example.csv")`
refer to that lecture's files. Put assets used by several lectures in `shared/`.
Change `shared/theme.scss` to update the collection's appearance. A lecture can
override project options in its own YAML front matter.

## Requirements

- Quarto
- R, with `knitr` and `rmarkdown`
- Any extra analysis packages documented by an individual lecture

The existing lecture uses base R for its calculations. Project output and
execution-directory behavior follow the [Quarto project options](https://quarto.org/docs/reference/projects/options).
