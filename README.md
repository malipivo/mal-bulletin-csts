# Information Bulletin of the Czech Statistical Society 
## (IB CStS; backup; git experiments and studies)

<https://www.statspol.cz/informacni-bulletin/on-line-verze/>

# General notes
* You will need TeX Live 2020 and most likely other stuff depending on the article (Python3, Manim, R, certain fonts from the internet, ...).
* `bash d.sh` is similar to `make`.
* `bash e.sh` is similar to `make clean`.
* Czech vocabulary for newbies as I do not plan to rename those folders/files/variables in near future: finalizace (final steps), obalka (envelope), zdrojaky (source codes), cislo (magazine issue), styl (TeX style), osnova (Table of Contents), stran (number of pages), prace (work), zahlavi (header), mustr (template), ...

# 2020-05-13, my bandwidth (git lfs; large file systems)

It's limited and png/jpg/pdf/ttf/otf files cannot be downloaded for 4 weeks. Contact me in case you want to download them.

# Common workflow, git notes

    cd <current issue>
    bash d.sh
    bash e.sh
    cd ..
    git add -A -v # --dry-run
    git commit -m "<date>"
    git push -v

It looks that downloading specific folder can be done this way, e.g., for the oldest magazine issue:

    svn export https://github.com/malipivo/mal-bulletin-csts/trunk/2019-4

or

    svn checkout https://github.com/malipivo/mal-bulletin-csts/trunk/2019-4

Before common `git clone <repository>` I need:

    sudo apt install git-lfs
    git lfs install

# Git-dependent back-up with `rsync`

I'm using (with or without `--dry-run`):

    rsync -aSvucR --delete --progress `git ls-files` <user>@<server>:<directory>
 
---

# IB 2020/3 and 2020/4
:clapper: **Work in progress (unfinished)!** :clapper:
* I am renaming `!finalizace` to `final-steps` and `!hlavni-soubor.tex` to `mal-core.tex`.
* I added a new variable if I want an envelope (during editing TeX files) or not.
* I am commenting out all unused packages, definitions and commands. 
* I added several comments to the core files (`mal-core.tex`, `e.sh` and `d.sh`).
* Learning `git` while typesetting these two issues.

# IB 2020/2
This is a milestone for me as:
* I'm using TeXLive 2020.
* I've started using the `hyperref` package again. It cost me several headaches in the past, so I had turned it off at some point. Now, I am starting to use it again.  It improves a web version, there is almost no change in the version for printing.
* I added metadata to the PDF file.
* I put first page as the before-the-last one, but that isn't the right way. The aim is to have page number of the PDF file equal to the page number on the web when browsing PDF.  I have an idea how to improve it from IB 2020/3 on...
* The envelope is a part of the main document for the first time. The reason is to preserve the Table of Contents clickable.
* Temporary solution: I am not deleting `!hlavni-soubor.aux` and `maosnova.tex` file to get envelope right during the first run.

# IB 2020/1
* I am using TeX Live 2019.
* From this issue on, I am using GhostScript for Black&White version of the PDF for printing as default.
* I added a note on envelope that we are using LuaTeX as an engine for typesetting.
* After some years, I've finally figured out how to use CSfonts (czechoslovak fonts) with LuaLaTeX (alternatives were: XeLaTeX, the unicodegen package, pdfLaTeX). I need Lua for smooth workflow, it prevailed my other priorities.

# IB 2019/4
* This is my old style where I used LuaLaTeX with Latin Modern fonts.
* For some reason I was using exclamation mark in the top-level TeX file (`!hlavni-soubor.tex`; main file) and in folder `!finalizace` (final version).

---

