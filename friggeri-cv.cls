\ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor, eso-pic}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{2B2B2B}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{F9F9F9}
\definecolor{black}{HTML}{000000}

%\definecolor{green}{HTML}{C2E15F}
%\definecolor{orange}{HTML}{FDA333}
%\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
%\definecolor{blue}{HTML}{6CE0F1}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

\AddToShipoutPictureBG{
% SIDE-STRIPE:
  \AtPageLowerLeft{%
    \color{lightgray}%
    \rule{5.45cm}{\dimexpr\pdfpageheight}%
  }}

%%%%%%%%%
% Fonts %
%%%%%%%%%

%%% modified by Karol Kozioł for ShareLaTex use
\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}

\newfontfamily\bodyfont
[BoldFont=texgyreheros-bold.otf,
ItalicFont=texgyreheros-italic.otf,
BoldItalicFont=texgyreheros-bolditalic.otf]
{texgyreheros-regular.otf}
\newfontfamily\thinfont[]{Lato-Light.ttf}
\newfontfamily\headingfont[]{texgyreheros-bold.otf}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont
[Mapping=tex-text, Color=textcolor,
BoldFont=texgyreheros-bold.otf,
ItalicFont=texgyreheros-italic.otf,
BoldItalicFont=texgyreheros-bolditalic.otf
]
{texgyreheros-regular.otf}

\setmathfont{texgyreheros-regular.otf}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=2.8cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{13pt}{23pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{2.25cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.25\parskip}%
  {%
  \large\headingfont\color{headercolor} #1%
  }
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}

\newenvironment{entrylist}{
}

\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{

  #1&\parbox[t]{15cm}{
    \textbf{#2} 
    \hfill
    {\footnotesize\addfontfeature{Color=black} #3}\\%
    #4\vspace{\parsep}%
  }\\}

%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
    
  }
  \color{lightgray}
  \begin{textblock}{3.8}(0.55, 2.9)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

\newcommand{\extraspace}[1]{\addvspace{1ex}#1}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=0.9cm,right=1.5cm,bottom=0.1cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}