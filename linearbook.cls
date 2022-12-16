% 文类定义和选项
%--------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{linearbook}[2021/05/01 A free LaTeX text book template.]

\RequirePackage{xparse}
\RequirePackage{etoolbox}

% 选项
\newbool{custom}            % 自定义中文字体

% 中文字体集选项(参考CTeX文档)
\newcommand\@fontset{windows}
\DeclareOption{adobe}{\renewcommand\@fontset{adobe}}      % Adobe字体
\DeclareOption{ubuntu}{\renewcommand\@fontset{ubuntu}}    % Ubuntu字体
\DeclareOption{mac}{\renewcommand\@fontset{mac}}          % Mac字体
\DeclareOption{windows}{\renewcommand\@fontset{windows}}  % Windows字体
\DeclareOption{fandol}{\renewcommand\@fontset{fandol}}    % Fandol字体
\DeclareOption{custom}{\booltrue{custom}\renewcommand\@fontset{none}}  % 自定义

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

\LoadClass[openany]{book}

% 页面和边距
%--------------------------------------------------------------------------
\RequirePackage[papersize={8in,10in},
                includemp=true,
                inner=2cm,outer=1.2cm,
                top=2cm,bottom=1.5cm,
                headsep=0.5cm,headheight=0.5cm,
                footskip=0.7cm,
                marginparsep=0.4cm,marginparwidth=4.5cm,
                % showframe,
                % showcrop
                ]{geometry}
\RequirePackage{multicol}           % 多栏
\RequirePackage{pdfpages}           % 插入pdf页面

% 配色
% 定理等盒子的配色见"盒子环境"部分
%--------------------------------------------------------------------------
\RequirePackage{xcolor}
\definecolor{lbdeepblue}{HTML}{2b6272}
\definecolor{lbblue}{HTML}{118098}
\definecolor{lbgrayblue}{HTML}{bfd6db}
\definecolor{lbdeepgreen}{HTML}{457d3a}
\definecolor{lbgreen}{HTML}{c7d9b2}
\definecolor{lbdeepyellow}{HTML}{d18e50}
\definecolor{lbyellow}{HTML}{ce8340}
\definecolor{lbred}{HTML}{a3262c}

% \RequirePackage{pagecolor}

% 语言和字体设置
%--------------------------------------------------------------------------
% 基本宏包
% \RequirePackage[american]{babel}            % 会导致更改目录名失效
\RequirePackage[OT1,T1]{fontenc}
\RequirePackage{inputenc}
\RequirePackage[no-math]{fontspec}

% 数学符号
\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{extarrows}                          % 特殊箭头
\RequirePackage{mathabx}

\everymath{\displaystyle}		% 数学公式均为display模式
\allowdisplaybreaks[4]			% 数学公式允许跨页

% 数学字体
%-------------------------------------
\RequirePackage{eucal}
\setmainfont{XITS}
\RequirePackage[math-style=TeX,
                bold-style=ISO]{unicode-math}       % 数学unicode-math宏包

\setmathfont{XITS Math}                             % 数学字体设置为XITS Math
%\RequirePackage[bb=ams,
%                frak=boondox,
%                scr=boondox,
%                cal=pxtx]{oldmathalpha}
% 2021-12-21
% 2021/11/18 v1.143 版本的mathalpha更新的命令与unicode-math相冲突
% 将对mathalpha的调用放在unicode-math前面可以解决这个冲突,但是字体
% 会被覆盖,这里用旧的版本
% 如果使用原配Computer Modern字族则不调用unicode-math即可

\RequirePackage{xfrac}              % 优化行内斜分数 \sfrac{1}{2}
\RequirePackage{siunitx}            % 标准单位宏包
\RequirePackage{physics}            % 物理宏包
\RequirePackage{nccmath}            % 数学环境拓展
\RequirePackage{zhnumber}           % 中文编号宏包

% 重设\sum符号
\DeclareSymbolFont{largesymbols}{OMX}{cmex}{m}{n}
\DeclareMathSymbol{\msum}{\mathop}{largesymbols}{"50}
% 重设\pi符号
\DeclareSymbolFont{letters}{OML}{cmm}{m}{it}
\DeclareMathSymbol{\mpi}{\mathord}{letters}{"19}
% 重设\tau符号
\DeclareMathSymbol{\mtau}{\mathord}{letters}{"1C}
% 更新符号命令
\renewcommand{\boldsymbol}{\symbf}

\RequirePackage{romanbar}             % 罗马数字
\RequirePackage{pifont}               % 符号宏包

% 配置字体
\RequirePackage{fix-cm}               % 调整字号
\RequirePackage[scheme = plain,       % 文字方案
                fontset=\@fontset,    % 字集
                zihao=5,              % 字号
                linespread=1.245,     % 行距
                heading=true]{ctex}   % 中文样式标题
% \ctexset{autoindent=2\ccwd}           % 缩进
\usepackage{indentfirst}
\setlength\parindent{2\ccwd}

\xeCJKsetup{PlainEquation=true}       % 使用$$...$$来输入行间公式
\xeCJKsetup{CJKmath=true}             % 在数学环境中输出CJK字符
\xeCJKsetup{EmboldenFactor=0}         % 伪加粗程度
\xeCJKsetup{CheckSingle=true}         % 避免孤字成行
\xeCJKsetwidth{、}{0.7em}

%!!! 使用Computer Modern字族时,将CJK字符和西文与数学公式的间距调小一点,同时也调整参考文献引用之间的间距
\newcommand{\lbglue}{\hskip 0.15\baselineskip plus 0.02\baselineskip minus 0.02\baselineskip}
\xeCJKsetup{CJKecglue = \lbglue}

% 自定义字体
\ifbool{custom}{
  % 中文字体
  \setCJKmainfont[ItalicFont={方正楷体简体},
                  BoldFont={方正黑体_GBK},
                  BoldItalicFont={方正粗楷简体}]{方正新书宋_GBK}
  \setCJKmonofont{方正仿宋简体}
  \setCJKsansfont[AutoFakeBold=true]{方正黑体_GBK}
  % 英文字体
  % \setmainfont{XITS}
  % \setmonofont{Courier New}
  % \setsansfont{Arial}
}{}

% 字体接口
%--------------------------------------------------------------------------
% 标题字体
\newcommand{\titlefont}{\CJKfontspec[AutoFakeBold=false]{方正清刻本悦宋简体.ttf}}
% 页眉字体
\newcommand{\headfont}{\CJKfontspec[AutoFakeBold=true]{方正楷体简体}}
% 黑体加粗
\newcommand{\blackheavy}{\CJKfontspec[AutoFakeBold=true]{方正黑体_GBK}}
% 页眉页脚页码数字字体、章节编号字体
\newcommand{\pplj}{\fontencoding{OT1}\fontfamily{pplj}\fontseries{m}\selectfont}
% 设置思源宋体字族
\newCJKfontfamily[sy]\siyuan{Noto Serif CJK SC}
% 楷体
\newcommand{\kaiti}{\CJKfontspec[AutoFakeBold=true]{方正楷体简体}}
% 仿宋
\newcommand{\fangsong}{\CJKfontspec[AutoFakeBold=true]{方正仿宋简体.otf}}
% 方正小标宋
\newcommand{\xiaobiaosong}{\CJKfontspec{方正小标宋简体.ttf}}
% 旁注编号字体
\newcommand{\marginnotenumberfont}{\fontspec[Annotation=3]{HiraMaruPro-W4.otf}}
\newcommand{\originalnotenumberfont}{\fontspec[Annotation=4]{HiraMaruPro-W4.otf}}
% section、subsection标题字体
% \newcommand{\sectitlefont}{\titlefont}
\newcommand{\sectitlefont}{\xiaobiaosong}
% section、subsection标题yanse
\newcommand{\sectitlecolor}{\color{lbdeepblue}}
% \newcommand{\sectitlecolor}{\color{black}}

% 插图和表格题注设置
%--------------------------------------------------------------------------
\RequirePackage{marginnote,sidenotes}
\RequirePackage[font=small,
                labelsep=quad,
                % labelfont={sf},
                position=bottom,
                figurename={图},
                tablename={表},
                strut=off
                ]{caption}
\RequirePackage{subcaption}
% \renewcommand{\thesubfigure}{\alph{subfigure}}
% \RequirePackage{subfigure}

% 修改边注图片的标题格式
\DeclareCaptionStyle{marginfigure}{
  labelsep=quad,
  font=small,
  position=bottom,
  strut=off,
  justification=centering
  }
% 修改边注标题格式
\DeclareCaptionStyle{sidecaption}{
  labelsep=quad,
  font=small,
  position=bottom,
  strut=off
  }
% 修改全页图片环境的标题格式
\DeclareCaptionStyle{widefigure}{
  labelsep=quad,
  font=small,
  position=bottom,
  strut=off,
  justification=centering
  % justification=raggedleft
  }

% 全页图片标题margin修改
% \BeforeBeginEnvironment{figure*}{\checkoddpage}
% \@ifoddpage{%
%   \captionsetup{margin={0cm,-4.8cm}}%
% }{%
%   \captionsetup{margin={-4.8cm,0cm}}%
% }}
% \AtBeginEnvironment{figure*}{\checkoddpage\@ifoddpage{%
% \captionsetup[widefigure]{margin={0cm,-4.8cm}}%
% }{%
% \captionsetup[widefigure]{margin={-4.8cm,0cm}}%
% }}

\newcommand{\fullcaptionsetup}{
  \checkoddpage\@ifoddpage{%
\captionsetup{margin={0cm,-4.8cm}}%
}{%
\captionsetup{margin={-4.8cm,0cm}}}}

% \newcommand{\efullcaption}[1]{\captionsetup{margin={-4.8cm,0cm}}%
% \caption{#1}}      % 偶数页全页标题
% \newcommand{\ofullcaption}[1]{\captionsetup{margin={0cm,-4.8cm}%
% \caption{#1}}      % 奇数页全页标题


\RequirePackage{wrapfig}            % 图文绕排
% \RequirePackage{floatrow}           % 图表浮动组 跟\sidecaption冲突
\RequirePackage{tabularray}         % 表格宏包
\UseTblrLibrary{booktabs}           % 使用booktabs拓展
\RequirePackage{paralist}	          % 列表宏包
\RequirePackage{enumerate}
\RequirePackage{enumitem}

% 交叉引用与书签
%--------------------------------------------------------------------------
\RequirePackage[colorlinks=ture,
            breaklinks=true,
            urlcolor=dr,
            citecolor=lbred,
            linkcolor=lbdeepblue,]{hyperref}     % 交叉引用
\hypersetup{hidelinks,
            % backref=true,
            % pagebackref=true,
            % hyperindex=true,
            colorlinks=ture,
            breaklinks=true,
            urlcolor=dr,
            citecolor=lbred,
            linkcolor=lbdeepblue,
            % bookmarks=true,
            bookmarksopen=true,
            bookmarksopenlevel=1,
            pdftitle={合成孔径雷达:成像算法与实现 | Digital Processing of Synthetic Aperture Radar Data: Algorithms and Implementation},
            pdfauthor={[加] Ian G. Cumming  Frank H. Wong 著 | 洪文  胡东辉  韩冰 等译 | 吴一戎 审校 | Jyun S. Wang 排注}}
\RequirePackage{bookmark}     % 书签编号
\bookmarksetup{numbered}

% 插图与绘图
%--------------------------------------------------------------------------
\RequirePackage{graphicx}
\graphicspath{{figures/}}
\graphicspath{{images/}}

\RequirePackage{svg}

% Tikz
\RequirePackage{tikz}
\usetikzlibrary{datavisualization}
\usetikzlibrary{intersections,angles,quotes}
\usetikzlibrary {arrows.meta}
\usetikzlibrary{datavisualization.formats.functions}
\usetikzlibrary{calc}
\usetikzlibrary{spy}
\usetikzlibrary{patterns,shapes.arrows}
\usetikzlibrary{external}
\tikzset{marrow/.style={>={Stealth[round]},shorten >=1pt}}
\tikzset{vector/.style={>={Stealth[inset=0pt, angle=25:5pt]}}}
\tikzset{every node/.style={font=\small}}
% 导出
% \tikzexternalize[prefix=tikzpictures/,up to date check=md5]
% \tikzset{external/only named=true}

% Circuitikz
\RequirePackage[siunitx,RPvoltages,european]{circuitikz}

% Pgfplots
\RequirePackage{pgfplots}
\pgfplotsset{compat=newest}
\usepgfplotslibrary{groupplots,dateplot}
\usepgfplotslibrary{groupplots,dateplot}
\usetikzlibrary{patterns,shapes.arrows}
\usetikzlibrary{patterns.meta}
\usepgfplotslibrary{fillbetween}

% 其他宏包
%--------------------------------------------------------------------------
\RequirePackage{blindtext}          % 无厘头文字
% \RequirePackage{makecell}           % 表格格式组织
% \RequirePackage{multirow}           % 表格行列格式
\RequirePackage{url}                % 超链接
% \RequirePackage{hologo}	            % TeX系列标识
\RequirePackage{ragged2e}           % 断词宏包

% 背景
%--------------------------------------------------------------------------
% \RequirePackage[pages=some]{background}
% \backgroundsetup{scale=1,color=black,opacity=1.0,angle=0,contents={}}

% 页眉、页脚和页码
%--------------------------------------------------------------------------
\RequirePackage{fancyhdr}
\RequirePackage{ifoddpage}          % 检测页码宏包
\RequirePackage{calc}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\addtolength{\headwidth}{\marginparsep}
\addtolength{\headwidth}{\marginparwidth}
\fancyheadoffset[roh,leh]{\marginparwidth + \marginparsep}
\pagestyle{fancy}

\renewcommand{\sectionmark}[1]{\markright{{\pplj\thesection}\quad #1}}  % 设定rightmark格式
% \renewcommand{\chaptermark}[1]{\markboth{第 {\pplj\thechapter} 章\quad #1}{}}

% front部分页眉页脚样式
\fancypagestyle{front}{
  \fancyhf{}
  \fancyheadoffset[roh,leh]{\marginparwidth + \marginparsep}
  \fancyhead[RO]{\kaiti \leftmark \qquad \textbf{\pplj \thepage}}
  \fancyhead[LE]{\kaiti \textbf{\pplj \thepage} \qquad \leftmark}
}

% 目录部分页眉页脚样式
\fancypagestyle{toc}{
  \fancyhf{}
  \fancyheadoffset[roh,leh]{\marginparwidth + \marginparsep}
  \fancyhead[RO]{\kaiti \leftmark \qquad \textbf{\pplj \thepage}}
  \fancyhead[LE]{\kaiti \textbf{\pplj \thepage} \qquad \leftmark}
}

% 正文部分页眉页脚样式
\fancypagestyle{main}{
  \fancyhf{}
  \fancyheadoffset[roh,leh]{\marginparwidth + \marginparsep}
  \fancyhead[RO]{\kaiti \rightmark \qquad \textbf{\pplj \thepage}}
  \fancyhead[LE]{\kaiti \textbf{\pplj \thepage} \qquad \leftmark}
}

% 附录部分页眉页脚样式
\fancypagestyle{back}{
  \fancyhf{}
  \fancyheadoffset[roh,leh]{\marginparwidth + \marginparsep}
  % \fancyhead[OR]{%
  % \kaiti%
  % \ifnum\value{chapter}>0 \@chapapp\ \thechapter. \fi%
  % \leftmark\qquad \textbf{\pplj \thepage}}%
  % \fancyhead[EL]{%
  % \kaiti%
  % \ifnum\value{chapter}>0 \@chapapp\ \thechapter. \fi%
  % \textbf{\pplj \thepage} \qquad \leftmark}%
  \fancyhead[RO]{\kaiti \leftmark \qquad \textbf{\pplj \thepage}}
  \fancyhead[LE]{\kaiti \textbf{\pplj \thepage} \qquad \leftmark}
}

% 一般页眉页脚设置
\fancypagestyle{plain}{% 更改章节页的页码位置
  \fancyhf{}
  \fancyfootoffset[RO,LE]{\marginparwidth + \marginparsep}
  \fancyfoot[RO,LE]{\textbf{\pplj \thepage}}
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
}

% Chapter样式
%--------------------------------------------------------------------------
\renewcommand{\@makechapterhead}[1]{
  \addtocontents{toc}{\protect\hypertarget{chap:\thechapter}{}}%  跳转回目录,定位点中不能有#1参数
  \checkoddpage
  \@ifoddpage{ % 奇数页
    \begin{tikzpicture}[remember picture,overlay]
      \node at (current page.north west)
        {
          \begin{tikzpicture}[remember picture,overlay]
            \draw[fill=lbdeepblue,draw opacity=0]
              ++(0,-2cm) rectangle ++(\paperwidth,-4pt);
            \node[color=lbdeepgreen,inner sep=12pt,below left] (chapter)
              at  +(\paperwidth-1.2cm,-2cm) {\fontsize{40pt}{1pt}\selectfont\pplj
              \protect\hyperlink{chap:\thechapter}{\thechapter}};
            \draw[line width=2pt,color=lbgreen]
              ++(\paperwidth-1.2cm,0) |- ($(chapter.south west)+(0,4pt)$);
            \node[color=lbdeepblue,left,outer sep=2pt] at (chapter.south west)
              {
                \parbox[c][][c]{18cm}
                {\flushright\Huge\bfseries\titlefont\fontspec{Palatino-Roman}
                \texorpdfstring{\protect\hyperlink{chap:\thechapter}{#1}}{#1}
                }
              };
          \end{tikzpicture}
        };
    \end{tikzpicture}
    \vspace{7cm}
    \renewcommand{\chaptermark}[1]{\markboth{\normalfont\kaiti %
          \protect\hyperlink{chap:\thechapter}{第{\pplj\thechapter}章\; #1}%
          }{}}%  设置页眉的章节标题超链接回目录
    \chaptermark{#1}%
  }{ % 偶数页
    \begin{tikzpicture}[remember picture,overlay]
      \node at (current page.north west)
        {
          \begin{tikzpicture}[remember picture,overlay]
            \draw[fill=lbdeepblue,draw opacity=0]
              ++(0,-2cm) rectangle ++(\paperwidth,-4pt);
            \node[color=lbdeepgreen,inner sep=12pt,below right] (chapter)
              at  +(1.2cm,-2cm) {\fontsize{40pt}{1pt}\selectfont\pplj
              \protect\hyperlink{chap:\thechapter}{\thechapter}};
            \draw[line width=2pt,color=lbgreen]
              ++(1.2cm,0) |- ($(chapter.south east)+(0,4pt)$);
            \node[color=lbdeepblue,right,outer sep=2pt] at (chapter.south east)
              {
                \parbox[c][][c]{18cm}
                {\flushleft\Huge\bfseries\titlefont\fontspec{Palatino-Roman}
                \texorpdfstring{\protect\hyperlink{chap:\thechapter}{#1}}{#1}
                }
              };
          \end{tikzpicture}
        };
    \end{tikzpicture}
    \vspace{7cm}
    \renewcommand{\chaptermark}[1]{\markboth{\normalfont\kaiti %
    \protect\hyperlink{chap:\thechapter}{第{\pplj\thechapter}章\; #1}  %
    }{}}%  设置页眉的章节标题超链接回目录
    \chaptermark{#1}%
  }
}

% 无编号Chapter样式
%--------------------------------------------------------------------------
\renewcommand{\@makeschapterhead}[1]{%
  \addtocontents{toc}{\protect\hypertarget{chap:\thechapter}{}}%  跳转回目录
  \checkoddpage
  \@ifoddpage{ % 奇数页
      \begin{tikzpicture}[remember picture,overlay]
        \node at (current page.north west)
          {
            \begin{tikzpicture}[remember picture,overlay]
              \draw[fill=lbdeepblue,draw opacity=0]
                ++(0,-2cm) rectangle ++(\paperwidth,-4pt);
              \node[inner sep=12pt,below left] (chapter)
                at  +(\paperwidth-4.5cm-0.4cm-1.2cm,-2.2cm) {\color{lbdeepblue}\Huge\bfseries\titlefont\fontspec{Palatino-Roman}%
                \texorpdfstring{\protect\hyperlink{chap:\thechapter}{#1}}{#1}
                };
              \draw[line width=2pt,color=lbgreen]
                ++(\paperwidth-4.5cm-0.4cm-1.2cm,0) |- ($(chapter.south west)+(0,4pt)$);
            \end{tikzpicture}
          };
      \end{tikzpicture}
      \vspace{7cm}
    % 页眉
    \renewcommand{\chaptermark}[1]{\markboth{\normalfont\kaiti %
    \protect\hyperlink{chap:\thechapter}{#1}  %
    }{}}%   设置页眉的章节标题超链接回目录
    \chaptermark{#1}%
  }{% 偶数页
      \begin{tikzpicture}[remember picture,overlay]
        \node at (current page.north west)
          {
            \begin{tikzpicture}[remember picture,overlay]
              \draw[fill=lbdeepblue,draw opacity=0]
                ++(0,-2cm) rectangle ++(\paperwidth,-4pt);
              \node[inner sep=12pt,below right] (chapter)
                at  +(4.5cm+0.4cm+1.2cm,-2.2cm) {\color{lbdeepblue}\Huge\bfseries\titlefont\fontspec{Palatino-Roman}%
                \texorpdfstring{\protect\hyperlink{chap:\thechapter}{#1}}{#1}
              };
              \draw[line width=2pt,color=lbgreen]
                ++(4.5cm+0.4cm+1.2cm,0) |- ($(chapter.south east)+(0,4pt)$);
            \end{tikzpicture}
          };
      \end{tikzpicture}
      \vspace{7cm}
    % 页眉
    \renewcommand{\chaptermark}[1]{\markboth{\normalfont\kaiti %
    \protect\hyperlink{chap:\thechapter}{#1}  %
    }{}}%  设置页眉的章节标题超链接回目录
    \chaptermark{#1}%
  }%

  % 上面这个空行不能删掉
}
% 因为在目录的地方改了marginparwidth,为了保持chapter标题的位置,直接使用\marginparwidth和
% \marginparsep绝对值

% Chapter 导言
%--------------------------------------------------------------------------
\newcommand{\introhead}[2][7cm]{
  \checkoddpage
  \@ifoddpage{ % 奇数页
    \begin{tikzpicture}[remember picture,overlay]
      \node at (current page.north west)
        {
          \begin{tikzpicture}[remember picture,overlay]
            \node[below right,inner sep=12pt] (text) at ++(2cm,-5cm)
              {
                \parbox[c][][c]{#1}
                {\small #2}
              };
            \draw[line width=2pt,color=lbgreen]
              ++(2cm,-2cm-4pt) |- (text.south east);
          \end{tikzpicture}
        };
    \end{tikzpicture}
    \vspace{2cm}
  }{ % 偶数页
    \begin{tikzpicture}[remember picture,overlay]
      \node at (current page.north west)
        {
          \begin{tikzpicture}[remember picture,overlay]
            \node[below left,inner sep=12pt] (text) at ++(\paperwidth-2cm,-5cm)
              {
                \parbox[c][][c]{#1}
                {\small #2}
              };
            \draw[line width=2pt,color=lbgreen]
              ++(\paperwidth-2cm,-2cm-4pt) |- (text.south west);
          \end{tikzpicture}
        };
    \end{tikzpicture}
    \vspace{2cm}
  }
}

% Section等样式
%--------------------------------------------------------------------------
\ctexset{
  part = {
    name={第,部分},
    aftername = \par\bigskip,
    titleformat+=\sectitlefont,
    nameformat+=\sectitlefont,
    format+=\sectitlecolor,
    number = \zhnumber{\arabic{part}}
  },
  chapter={
    name={第,章}
  },
  section={
    titleformat+=\sectitlefont\sectitlecolor,
    numberformat+=\sectitlefont\fontspec{Palatino-Roman}\color{lbdeepyellow},
    aftertitle=\sectionline,
  },
  subsection={
    titleformat+=\sectitlefont\sectitlecolor,
    numberformat+=\fontspec{Palatino-Roman}\color{lbdeepyellow},
  },
  subsubsection={
    titleformat+=\sectitlefont\color{lbdeepyellow},
    beforeskip={1.25ex plus .5ex minus .2ex},
    afterskip={0.5ex plus .2ex}
  },
  bibname = {参考文献},
  appendixname= {附录}
}

\newlength{\sectionlabelwidth}
\newcommand{\sectionline}{  % section的装饰线
  \settowidth{\sectionlabelwidth}{\thesection}
  \checkoddpage
  \@ifoddpage{\par\vspace*{-1.1em}
    \noindent\tikz[remember picture,overlay] \draw[lbgrayblue,very thick]
    (0,0) -- (\textwidth+\marginparwidth+\marginparsep,0)
    (1.3\sectionlabelwidth,0) |- (0,0.8);\par
  }{\par\vspace*{-1.1em}
    \noindent\tikz[remember picture,overlay] \draw[lbgrayblue,very thick]
    (-\marginparwidth-\marginparsep,0) -- (\textwidth,0)
    (1.3\sectionlabelwidth,0) |- (0,0.8);\par
  }
}

% 定义一个新的section命令
% 没有编号,但能够加入TOC
\newcommand{\plainsectionline}{  % 无编号section的装饰线
  \checkoddpage
  \@ifoddpage{\par\vspace*{-1.1em}
  \noindent\tikz[remember picture,overlay] \draw[lbgrayblue,very thick]
    (0,0) -- (\textwidth+\marginparwidth+\marginparsep,0);\par
  }{\par\vspace*{-1.1em}
  \noindent\tikz[remember picture,overlay] \draw[lbgrayblue,very thick]
    (-\marginparwidth-\marginparsep,0) -- (\textwidth,0);\par
  }
}

\newcommand{\plainsection}[1]{   % 定制的无编号section命令
  \vspace{3.5ex plus 1ex minus .2ex}

  \addtocontents{toc}{\protect\hypertarget{\thechapter.#1}{}} % 加入目录定位点
  \phantomsection\addcontentsline{toc}{section}{\hskip -1cm #1}  % 添加到目录
  \renewcommand{\sectionmark}[1]{\markright{\protect\hyperlink{\thechapter.#1}{#1}}}% 修改页眉为无编号格式,并超链接回目录
  \sectionmark{#1}
  {\par\noindent \normalfont\Large\bfseries\sectitlefont\sectitlecolor
  \texorpdfstring{\protect\hyperlink{\thechapter.#1}{#1}}{#1} \plainsectionline}

  \vspace{2.3ex plus .2ex}
  }

\RequirePackage{suffix}
\WithSuffix\newcommand\plainsection*[1]{  % 无编号,并且也不加入到目录 plainsection
  \vspace{3.5ex plus 1ex minus .2ex}

  \addtocontents{toc}{\protect\hypertarget{\thechapter.#1}{}}
  {\par\noindent \normalfont\Large\bfseries\sectitlefont\sectitlecolor
  \texorpdfstring{\protect\hyperlink{\thechapter.#1}{#1}}{#1} \plainsectionline}

  \vspace{2.3ex plus .2ex}
  }

% 横跨整个页面的分割线
%--------------------------------------------------------------------------
\newcommand{\lbline}{
  \checkoddpage
  \@ifoddpage{\par
    \tikz[remember picture,overlay] \draw[fill=lbdeepblue,draw opacity=0]
    (-2.74cm,0) rectangle ++(\paperwidth,-4pt);\par
    \vspace*{1em}\par
  }{\par
    \tikz[remember picture,overlay] \draw[fill=lbdeepblue,draw opacity=0]
    (-6.84cm,0) rectangle ++(\paperwidth,-4pt);\par
    \vspace*{1em}\par
  }
}

% 更改目录名
%--------------------------------------------------------------------------
\renewcommand{\contentsname}{目录}

% 目录样式
%--------------------------------------------------------------------------
\RequirePackage{titletoc}
\setcounter{tocdepth}{1}

% 修改目录的部分样式
\titlecontents{part}[-0.4cm]{\addvspace{10pt}\large\bfseries\sectitlefont\sectitlecolor}
{\contentslabel[\fontspec{Palatino-Roman}\bfseries\large\color{lbdeepblue}\thecontentslabel]{0cm}}{}
{\hfill\normalsize\bfseries\fontspec{Palatino-Roman}\color{lbdeepblue}\thecontentspage}
% [\plainsectionline]

% 修改目录的章节样式
\titlecontents{chapter}[1.5cm]{\addvspace{10pt}\large\bfseries\sectitlefont\sectitlecolor}
{\contentslabel[\fontspec{Palatino-Roman}\bfseries\large\color{lbdeepgreen}\thecontentslabel]{1.9cm}}{}
{\hfill\normalsize\bfseries\fontspec{Palatino-Roman}\color{black}\thecontentspage}
% [\plainsectionline]

% 修改目录的section样式
\titlecontents{section}[2.5cm]{}
{\contentslabel[\fontspec{Palatino-Roman}\thecontentslabel]{1cm}}{}
{\;\titlerule*[.7pc]{$\cdot$}\;\normalsize\fontspec{Palatino-Roman}\color{black}\thecontentspage}

% 修改目录的subsection样式
\titlecontents{subsection}[3.85cm]{}
{\contentslabel[\fontspec{Palatino-Roman}\thecontentslabel]{1.3cm}}{}
{\;\titlerule*[.7pc]{$\cdot$}\;\normalsize\fontspec{Palatino-Roman}\color{black}\thecontentspage}

% part双向调度
\let\oldpart\part
\renewcommand\part[1]{%
    \addtocontents{toc}{\protect\hypertarget{#1}{}} % 添加定位点
    \oldpart{\texorpdfstring{\protect\hyperlink{#1}{#1}}{#1}}
    } %%

% section双向调度
\let\oldsection\section
\renewcommand\section[1]{%
    \renewcommand{\sectionmark}[1]{\markright{
      \protect\hyperlink{\thechapter.#1}{{\pplj\thesection}\quad #1}%
      }}% 每次用section都更新一次命令,如果上一次是类似\section*{}样式的,这样才能得到正确的右页眉
    \addtocontents{toc}{\protect\hypertarget{\thechapter.#1}{}} % 添加定位点
    \oldsection{\texorpdfstring{\protect\hyperlink{\thechapter.#1}{#1}}{#1}}
    } %%

% subsection双向调度
\let\oldsubsection\subsection
\renewcommand\subsection[1]{%
    \addtocontents{toc}{\protect\hypertarget{\thesection.#1}{}} % 添加定位点
    \oldsubsection{\texorpdfstring{\protect\hyperlink{\thesection.#1}{#1}}{#1}}
    } %%

% 盒子环境
%--------------------------------------------------------------------------
% 颜色配置
\definecolor{lbdefcolor}{HTML}{008194}  % 定义颜色
\definecolor{lbthecolor}{HTML}{ffb94c}  % 定理颜色
\definecolor{lblemcolor}{HTML}{a8a8a8}  % 引理颜色
\definecolor{lbremcolor}{HTML}{9ab685}  % 标注颜色
\definecolor{lbexacolor}{HTML}{a62b31}  % 例子颜色

\RequirePackage[many]{tcolorbox}
\newtheoremstyle{lbstyle}%
  {}%
  {}%
  {}%
  {}%
  {\sffamily}%
  {}%
  {\ccwd}%
  {}%

\renewenvironment{proof}{{\blackheavy\bfseries 证明 }\setlength{\parindent}{2\ccwd}}{\hfill $\qedsymbol$}

\theoremstyle{lbstyle}{
  \newtheorem*{remark}{提醒}
}

\theoremstyle{lbstyle}{
  \newtheorem{property}{性质}[section]
}
\renewcommand{\theproperty}{\thechapter.\arabic{section}.\arabic{property}}

\theoremstyle{lbstyle}{
  \newtheorem{definition}{定义}[section]
}
\renewcommand{\thedefinition}{\thechapter.\arabic{section}.\arabic{definition}}

\theoremstyle{lbstyle}{
  \newtheorem{theorem}{定理}[section]
}
\renewcommand{\thetheorem}{\thechapter.\arabic{section}.\arabic{theorem}}

\theoremstyle{lbstyle}{
  \newtheorem{tuilun}{推论}[section]
}
\renewcommand{\thetuilun}{\thechapter.\arabic{section}.\arabic{tuilun}}

\theoremstyle{lbstyle}{
  \newtheorem{lemma}{引理}[section]
}
\renewcommand{\thelemma}{\thechapter.\arabic{section}.\arabic{lemma}}

\theoremstyle{lbstyle}{
  \newtheorem{example}{\color{lbexacolor}例\hspace*{-4pt}}[chapter]
}
\renewcommand{\theexample}{\arabic{chapter}.\arabic{example}}

\theoremstyle{lbstyle}{
  \newtheorem{problem}{\color{lbdeepgreen}习题\hspace*{-4pt}}[chapter]
}
\renewcommand{\theproblem}{\arabic{chapter}.\arabic{problem}}


% \theoremstyle{lbstyle}{
%     \newtheorem{exercise}{}[chapter]
% }

% 解答环境
\newcommand*{\sed}[1][$\qedsymbol$]{%
\leavevmode\unskip\penalty9999 \hbox{}\nobreak\hfill
    \quad\hbox{#1}%
}
\newenvironment{solution}[1][解]{\setlength{\parindent}{2\ccwd}
  \pushQED{\sed}%
  % \normalfont \topsep6\p@\@plus6\p@\relax
  % \trivlist
  % \item[\sffamily\bfseries
  %   \,#1\hspace{.5em}]\ignorespaces
  \par\noindent\,{\sffamily\bfseries #1}\hspace{.5em}\ignorespaces
}{\popQED\@endpefalse\par}

% 盒子设置
\tcolorboxenvironment{property}{
  boxrule=0pt,
  boxsep=2pt,
  colback={white!90!lblemcolor},
  enhanced jigsaw,
  borderline west={2pt}{-7pt}{lblemcolor},
  sharp corners,
  before skip=10pt,
  after skip=10pt,
  left=0pt,
  right=0pt,
  breakable,
}

\tcolorboxenvironment{tuilun}{
  boxrule=0pt,
  boxsep=2pt,
  colback={white!90!lbdeepblue},
  enhanced jigsaw,
  borderline west={2pt}{-7pt}{lbdeepblue},
  sharp corners,
  before skip=10pt,
  after skip=10pt,
  left=0pt,
  right=0pt,
  breakable,
}

\tcolorboxenvironment{definition}{
  boxrule=0pt,
  boxsep=2pt,
  colback={white!90!lbdefcolor},
  enhanced jigsaw,
  borderline west={2pt}{-7pt}{lbdefcolor},
  sharp corners,
  before skip=10pt,
  after skip=10pt,
  left=0pt,
  right=0pt,
  breakable,
}

\tcolorboxenvironment{theorem}{
  boxrule=0pt,
  boxsep=2pt,
  colback={white!90!lbthecolor},
  enhanced jigsaw,
  borderline west={2pt}{-7pt}{lbthecolor},
  sharp corners,
  before skip=10pt,
  after skip=10pt,
  left=0pt,
  right=0pt,
  breakable,
}

\tcolorboxenvironment{lemma}{
  boxrule=0pt,
  boxsep=2pt,
  blanker,
  borderline west={2pt}{-7pt}{lblemcolor},
  before skip=10pt,
  after skip=10pt,
  sharp corners,
  left=0pt,
  right=0pt,
  breakable,
}

\tcolorboxenvironment{proof}{
  boxrule=0pt,
  boxsep=2pt,
  blanker,
  before skip=10pt,
  after skip=10pt,
  left=0pt,
  right=0pt,
  breakable,
}

\tcolorboxenvironment{remark}{
  boxrule=0pt,
  boxsep=2pt,
  blanker,
  borderline west={2pt}{-7pt}{lbremcolor},
  before skip=10pt,
  after skip=10pt,
  left=0pt,
  right=0pt,
  breakable,
}

\tcolorboxenvironment{example}{
  boxrule=0pt,
  boxsep=2pt,
  blanker,
  borderline west={2pt}{-7pt}{lbexacolor},
  sharp corners,
  before skip=10pt,
  after skip=10pt,
  left=0pt,
  right=0pt,
  breakable,
}

\tcolorboxenvironment{problem}{
  boxrule=0pt,
  boxsep=2pt,
  blanker,
  borderline west={2pt}{-7pt}{lbdeepgreen},
  sharp corners,
  before skip=10pt,
  after skip=10pt,
  left=0pt,
  right=0pt,
  breakable,
}

% 环境
%--------------------------------------------------------------------------
% \RequirePackage{changepage}         % 改变页面边距 有冲突
\newcounter{fullwidthlinewidth}  % 全页宽环境,上下带线条[可选参数]为线条粗细
\newenvironment{fullwidthline}[1][2]
    { \checkoddpage
      \setcounter{fullwidthlinewidth}{#1} % 线条粗细
      \par\vspace*{5mm}\noindent
      \@ifoddpage{\hspace{-2pt}}{\hspace{-\marginparwidth-\marginparsep-3pt}}
      \begin{minipage}{\textwidth+\marginparwidth+\marginparsep}
      {\color{lbgreen}\hrule height #1pt}\medskip
    }
    {
      \medskip{\color{lbgreen}\hrule height \value{fullwidthlinewidth}pt}
      \end{minipage}\vspace*{5mm}
    }

\newenvironment{fullwidth}  % 全页宽环境,无线条
    { \checkoddpage
      \noindent
      \@ifoddpage{\hspace{-2pt}}{\hspace{-\marginparwidth-\marginparsep-3pt}}
      \begin{minipage}{\textwidth+\marginparwidth+\marginparsep}
    }
    {
      \end{minipage}
    }

% 习题环境
\newenvironment{exercises}
    {
      \begin{enumerate}[align=right,label={\thechapter.\arabic*},parsep=0em,itemsep=0em,topsep=0em]%
    }
    {
      \end{enumerate}
    }

% 章节附录环境
\newcommand{\newsectionline}{  % section的装饰线
  \settowidth{\sectionlabelwidth}{\thesection}
  \checkoddpage
  \@ifoddpage{\par\vspace*{-1.1em}
    \noindent\tikz[remember picture,overlay] \draw[lbgrayblue,very thick]
    (0,0) -- (\textwidth+\marginparwidth+\marginparsep,0)
    (1.1\sectionlabelwidth,0) |- (0,0.8);\par
  }{\par\vspace*{-1.1em}
    \noindent\tikz[remember picture,overlay] \draw[lbgrayblue,very thick]
    (-\marginparwidth-\marginparsep,0) -- (\textwidth,0)
    (1.1\sectionlabelwidth,0) |- (0,0.8);\par
  }
}

\newcounter{ChApp}[chapter]
\newcommand{\CAsection}[1]{%
\setcounter{subsection}{0}%
\refstepcounter{ChApp}%
\vspace{3.5ex plus 1ex minus .2ex}

\addtocontents{
}{\protect\hypertarget{\thechapter.#1}{}} % 加入目录定位点
\phantomsection\addcontentsline{}{section}{\protect\numberline{\thesection}\hskip 2.5em #1}  % 添加到目录
\renewcommand{\sectionmark}[1]{\markright{\protect\hyperlink{\thechapter.#1}{#1}}}% 修改页眉为无编号格式,并超链接回目录
\sectionmark{#1}
{\par\noindent\normalfont\Large\bfseries%
{\sectitlefont\fontspec{Palatino-Roman}\color{lbdeepyellow}\thesection}\quad%
\sectitlefont\sectitlecolor%
\texorpdfstring{\protect\hyperlink{\thechapter.#1}{#1}}{#1} \newsectionline}

\vspace{2.3ex plus .2ex}
}

\newenvironment{chapterappendix}{%
  \renewcommand{\thesection}{附录\thechapter\Alph{ChApp}}%
  \renewcommand{\thesubsection}{\thechapter\Alph{ChApp}.\arabic{subsection}}%
}{}

% 旁注
%--------------------------------------------------------------------------
% 修改缩进
\renewcommand*{\raggedleftmarginnote}{\noindent}
\renewcommand*{\raggedrightmarginnote}{\noindent}
% 修改编号
% \renewcommand{\thesidenote}{\sidenotenumberfont\arabic{sidenote}}
% 注记编号
\newcounter{marginnote}[section]
\newcounter{originalnote}[section]
\newcommand{\mn}[1]{\refstepcounter{marginnote}\textsuperscript{\marginnotenumberfont\scriptsize\themarginnote}{}\marginnote{\textsuperscript{\marginnotenumberfont\scriptsize\themarginnote}{}\;\small #1}}
% 在定理,定义等环境中使用,有标号,不会重叠 smn: special marginnote
\WithSuffix\newcommand\mn*[1]{\marginnote{\small #1}} % 无标号,会重叠 mns: marginnote star
\newcommand\mntext[2][]{\marginnote{\textsuperscript{\marginnotenumberfont\scriptsize #1}{}\;\small #2}} % 无标号,会重叠 mns: marginnote star
% \newcommand{\sn}[1]{\sidenote{\small #1}}  % 有标号,不会重叠,定义定理等环境中无法使用 sn: sidenote
\newcommand{\on}[1]{\refstepcounter{originalnote}\textsuperscript{\originalnotenumberfont\scriptsize\theoriginalnote}{}\marginnote{\textsuperscript{\originalnotenumberfont\scriptsize\theoriginalnote}{}\;\small #1}}
% 仅仅是插入一个编号
\newcommand{\mnmark}{\refstepcounter{marginnote}\textsuperscript{\marginnotenumberfont\scriptsize\themarginnote}{}\;}
\newcommand{\pmnmark}[1]{\textsuperscript{\marginnotenumberfont\scriptsize #1}{}\;} % 只打标号,不更新计数器

% 将每页的旁注编号清零
\RequirePackage{eso-pic}
\newcommand{\clearsidenotenumber}{%
  \AddToShipoutPicture{%
  \setcounter{marginnote}{0}
  \setcounter{originalnote}{0}
  }%
}

% 附录编号
%--------------------------------------------------------------------------
\newcounter{appendix}
\renewcommand{\theappendix}{附录\Alph{appendix}}
\newcommand{\appendixchapter}[1]{
  \refstepcounter{appendix}
  \addcontentsline{toc}{part}{\texorpdfstring{\theappendix\quad #1}{\theappendix~#1}}
  \chapter*{#1}
  \stepcounter{chapter}% 更新chapter计数器,同时重置references编号计数器
}
\WithSuffix\newcommand\appendixchapter*[1]{
  \let\@makeschapterhead\oldmakeschapterhead
  \addcontentsline{toc}{part}{#1}
  \chapter*{#1}
  \stepcounter{chapter}% 更新chapter计数器,同时重置references编号计数器
  \let\@makeschapterhead\newmakeschapterhead
}


% 文档开头设置
%--------------------------------------------------------------------------
\AtBeginDocument{
% 将XITS中的\pi和\sum替换为Computer Modern Math中对应的符号,可取消
%--------------------------------------------------------------------------
\let\pi\mpi
\let\sum\msum
\let\tau\mtau
% 让\cleardoublepage页面为空
\let\origdoublepage\cleardoublepage
\newcommand{\clearemptydoublepage}{%
  \clearpage
 {\pagestyle{empty}\origdoublepage}%
}%
\let\cleardoublepage\clearemptydoublepage
}

% 参考文献
%--------------------------------------------------------------------------
% \RequirePackage[backend=biber,
%                 style=gb7714-2015ms,  % 同一文献表中不同语言区分著录格式的样式 (gb7714-2015ms)
%                 gbstyle=false,
%                 hyperref=true,
%                 % backref=true,
%                 ]{biblatex}
% \addbibresource{bibliography.bib}

\newcounter{references}[chapter] % 参考文献引用计数器
\renewcommand{\thereferences}{\thechapter.\arabic{references}}
\newcommand{\refitem}{\item[{[\refstepcounter{references}\hyperlink{re:\thechapter.\arabic{references}}{\arabic{references}}]}]%
\hypertarget{\thereferences}{}} % 双向链接

\newenvironment{references} % 参考文献环境
    {
      \begin{enumerate}[align=right,label={[\arabic*]},parsep=0em,itemsep=0em,topsep=0em]\small%
    }
    {
      \end{enumerate}
    }

% 引用
\newcommand{\refcite}[1]{\lbglue\hypertarget{re:\thechapter.#1}{}[{\color{lbred}\hyperlink{\thechapter.#1}{#1}}]}  % 单引用
\newcommand{\trefcite}[2]%
{\lbglue\hypertarget{re:\thechapter.#1}{}[{\color{lbred}\hyperlink{\thechapter.#1}{#1}}%
, \hypertarget{re:\thechapter.#2}{}{\color{lbred}\hyperlink{\thechapter.#2}{#2}}]}  % 两个引用
\newcommand{\mrefcite}[2]%
{\lbglue\hypertarget{re:\thechapter.#1}{}[{\color{lbred}\hyperlink{\thechapter.#1}{#1}}%
--\hypertarget{re:\thechapter.#2}{}{\color{lbred}\hyperlink{\thechapter.#2}{#2}}]}  % 多引用

% 只有左边有空白
\newcommand{\lbsref}[1]{\lbglue\ref{#1}}
\newcommand{\lbseqref}[1]{\lbglue\eqref{#1}}

% 两边都有空白
\newcommand{\lbdref}[1]{\lbglue\ref{#1}\lbglue{}}
\newcommand{\lbdeqref}[1]{\lbglue\eqref{#1}\lbglue{}}

% 索引
%--------------------------------------------------------------------------
% \RequirePackage{makeidx}
% \makeindex

% 概念
\newcommand{\concept}[1]{%
  \noindent \makebox[0pt][r]{
    \raisebox{-1pt}{\tikz \fill[lbdeepgreen] (0,0) rectangle +(2pt,10pt);}%
  \hspace{5pt}}{\color{lbdeepgreen}\hspace{1.8em} #1}\hspace{\ccwd}\ignorespaces
  }

% 最后一页
\RequirePackage{totpages}
\newcounter{tp}                              % tp:total pages

% 自定义命令
%--------------------------------------------------------------------------
\newcommand{\sj}[1][2]{\hspace{#1\ccwd}}     % 手动缩进命令:\sj[<数字>自定义距离],默认为两个字宽.
\newcommand{\hc}[1]{{\blackheavy #1}}        % 黑体
\newcommand*{\dif}{\mathop{}\!\mathrm{d}}    % 微分号
\newcommand{\dw}[2][0.25\ccwd]{\hspace{#1}\si{#2}}    % 单位(前面保留1/4文字间距,°不需要)
\newcommand{\Rnum}[1]{\Romannum{#1}}         % 大写罗马数字
\newcommand{\Rp}{\mathcal{R}e}               % Re符号 Real part
\newcommand{\Ip}{\mathcal{I}m}               % Im符号 Imaginary part
\newcommand{\jh}[1]{\mathcal{#1}}            % 集合符号
\newcommand{\T}{^\top}                       % 矩阵转置符号
\newcommand{\mpunct}[1]{\,#1}                % 数学行间公式标点符号

\newcommand{\wk}{\lbglue{\Large $\omega$}K}                  % wK
\newcommand{\wka}{\lbglue{\Large $\omega$}KA}                  % wK
\endinput