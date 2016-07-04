\NeedsTeXFormat{LaTeX2e}[2011/06/27]
\ProvidesClass{frigaard}[2016/07/04]
\LoadClass[12pt,a4paper,titlepage]{article}

\newcommand{\david}{\noindent David Frigaard \hfill \today \\
	}
	

\newcommand{\frigaardLaTeX}{frigaard\LaTeX}


%General Setup
\RequirePackage[fleqn]{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{siunitx}
\RequirePackage{nicefrac}
\RequirePackage{graphicx}
\RequirePackage[x11names,table]{xcolor}
\RequirePackage[protrusion=true, expansion]{microtype}
\RequirePackage[english]{babel}
\RequirePackage{csquotes}

\RequirePackage{pgfplots}
\pgfplotsset{axis x line=bottom, axis y line=left, ylabel near ticks, xlabel near ticks,}
\usetikzlibrary{arrows}
\usetikzlibrary{patterns}
\usepgfplotslibrary{fillbetween}

\RequirePackage{etoolbox}

%Titlepages
\newtoggle{iltitle}
\toggletrue{iltitle}

\DeclareOption{iltitle}{\toggletrue{iltitle}}
\DeclareOption{fptitle}{\togglefalse{iltitle}}
\ProcessOptions

\newcommand{\subtitle}[1]{\def \@subtitle{#1}} \subtitle{}

\iftoggle{iltitle}
{\def \maketitle{
		\thispagestyle{empty}
			\begin{center}
				{\large\@author} \hfill {\large\@date} \\
				\vspace{2\baselineskip}
				{\Large\@title} \\
				\vspace{0.5\baselineskip}
				\ifx \@subtitle \empty	\vspace{\baselineskip} \else {\large\sl\@subtitle} \\ \fi
				\vspace{2\baselineskip}
			\end{center}
		\noindent}}
{\def \maketitle{
		\thispagestyle{empty}
			\begin{center}
				\vfill\vfill
				{\large\@author} 
				\vfill
				{\Large\@title} \\
				\vspace{2\baselineskip}
				\ifx \@subtitle \empty	\vspace{\baselineskip} \else {\large\sl\@subtitle} \\ \fi
				\vfill {\large\sl\@date} \\
				\vspace{2\baselineskip}								
			\end{center}
		\clearpage
		\setcounter{page}{1}}}

%Tables
\RequirePackage{float}
\RequirePackage{booktabs}
\RequirePackage[font={small,sc},margin=1cm,justification={centerlast,justified}]{caption}


%Lists

\let\oldenumerate\enumerate
\renewcommand{\enumerate}{
	\oldenumerate
	\setlength{\itemsep}{1pt}
	\setlength{\parskip}{0pt}
	\setlength{\parsep}{0pt}
}
\renewcommand{\theenumi}{\alph{enumi}}

\let\olditemize\itemize
\renewcommand{\itemize}{
	\olditemize
	\setlength{\itemsep}{1pt}
	\setlength{\parskip}{0pt}
	\setlength{\parsep}{0pt}
}
\renewcommand{\labelitemi}{$\circ$}

%Headings
\RequirePackage{titlesec}

\titleformat{\part}[display]{\raggedright}{\large Part \thepart}{0mm}{\LARGE\slshape}{}
\let\oldpart\part
\renewcommand{\part}{\clearpage\oldpart}

\titleformat{\section}[hang]{\raggedright}{\Large\thesection.}{0.5em}{\Large}{}
\titleformat{\subsection}[hang]{\raggedright}{\large\thesubsection.}{0.5em}{\large}{}
\titleformat{\subsubsection}[hang]{\raggedright}{\normalsize\thesubsubsection.}{0.5em}{\large}{}

%Page setup
\RequirePackage[margin=30mm]{geometry}
\RequirePackage{setspace}