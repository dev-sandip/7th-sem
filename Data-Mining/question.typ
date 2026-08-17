// Some definitions presupposed by pandoc's typst output.
#let blockquote(body) = [
  #set text( size: 0.92em )
  #block(inset: (left: 1.5em, top: 0.2em, bottom: 0.2em))[#body]
]

#let horizontalrule = [
  #line(start: (25%,0%), end: (75%,0%))
]

#let endnote(num, contents) = [
  #stack(dir: ltr, spacing: 3pt, super[#num], contents)
]
#show terms: it => {
  it.children
    .map(child => [
      #strong[#child.term]
      #block(inset: (left: 1.5em, top: -0.4em))[#child.description]
      ])
    .join()
}

#let conf(
  title: none,
  authors: none,
  date: none,
  abstract: none,
  cols: 1,
  margin: (x: 1.25in, y: 1.25in),
  paper: "us-letter",
  lang: "en",
  region: "US",
  font: (),
  fontsize: 11pt,
  sectionnumbering: none,
  doc,
) = {
  set page(
    paper: paper,
    margin: margin,
    numbering: "1",
  )
  set par(justify: true)
  set text(lang: lang,
           region: region,
           font: font,
           size: fontsize)
  set heading(numbering: sectionnumbering)

  if title != none {
    align(center)[#block(inset: 2em)[
      #text(weight: "bold", size: 1.5em)[#title]
    ]]
  }

  if authors != none {
    let count = authors.len()
    let ncols = calc.min(count, 3)
    grid(
      columns: (1fr,) * ncols,
      row-gutter: 1.5em,
      ..authors.map(author =>
          align(center)[
            #author.name \
            #author.affiliation \
            #author.email
          ]
      )
    )
  }

  if date != none {
    align(center)[#block(inset: 1em)[
      #date
    ]]
  }

  if abstract != none {
    block(inset: 2em)[
    #text(weight: "semibold")[Abstract] #h(1em) #abstract
    ]
  }

  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}
#show: doc => conf(
  title: [Data Mining (CT72502) --- Past Questions by Chapter],
  fontsize: 10pt,
  font: ("DejaVu Sans",),
  margin: (x: 1.8cm, y: 2cm),
  cols: 1,
  doc,
)


= Data Mining (CT72502) — Past Questions Organized by Syllabus Chapter
<data-mining-ct72502-past-questions-organized-by-syllabus-chapter>

#horizontalrule

= Chapter 1: Introduction (2 hrs)
<chapter-1-introduction-2-hrs>
=== 1.1 Data Mining Origin | 1.2 Data Mining & Data Warehousing Basics
<data-mining-origin-1.2-data-mining-data-warehousing-basics>
- Differentiate between data mining and data warehousing. \[2083
  Baishakh, 4\]
- What is data mining? Describe the steps involved in data mining.
  \[2082 Bhadra, 2+6\]
- "Data mining turns a large collection of data into knowledge". Justify
  your answer with suitable example. \[2081 Bhadra, 6\]
- What is Data mining? Explain the steps of KDD process briefly. \[2081
  Baishakh, 2+5\]
- Write key features of data warehouse. Explain each steps of knowledge
  discovery data mining process with a suitable example. \[2080 Bhadra,
  2+5\]
- What is data warehousing? Explain with example where data warehouses
  are used. \[2080 Baishakh, 2+4\]
- What is Data Mining? What are the steps involved in knowledge
  discovery process? \[2079 Bhadra, 1+5\]
- Describe the process of knowledge discovery in databases. Explain the
  specific challenges that motivated the development of data mining.
  \[2079 Chaitra, 3+3\]
- Explain how data mining system can be integrated with database/data
  warehouse system. Explain Data mining process with diagram. \[2078
  Bhadra, 4+2\]
- What are the fundamental differences between Data Mining and Data
  Warehousing? Describe the steps of KDD for data mining. \[2076 Ashwin,
  3+7\]
- How is data warehouse different from a database? How are they similar?
  \[2075 Ashwin, 2+2\]
- What is data mining? Explain the process of data mining. \[2074
  Ashwin, 2+3\]
- "The world is data rich but information is poor". Justify with your
  own words. \[2073 Shrawan, 8\]
- How is data warehouse different from RDBMS? Also list the
  similarities. \[2073 Chaitra, 2+2\]
- What is a data mining? Explain general steps in brief. \[2072 Kartik,
  4\]
- What is data mining? Explain all the steps of knowledge discovery.
  \[2072 Chaitra, 2+6\]
- What is data mining? Explain different data types of attributes in a
  dataset. \[2071 Shawan\]
- Write short notes on: Data warehouse and data mart. \[2071 Shawan\]
- What is a Data Mining? Explain its application. \[2071 Chaitra\]
- Write short notes on: Data ware house. \[2070 Ashad, 5\]
- Write short notes on: Data ware house and Data mart. \[2070 Chaitra,
  part of 15\]
- Write short notes on: Data mart. \[2069 Chaitra, 5\]

#horizontalrule

= Chapter 2: Data Preprocessing (6 hrs)
<chapter-2-data-preprocessing-6-hrs>
=== 2.1 Data Types and Attributes | 2.2 Data Pre-processing | 2.3 OLAP &
Multidimensional Data Analysis | 2.4 Various Similarity Measures
<data-types-and-attributes-2.2-data-pre-processing-2.3-olap-multidimensional-data-analysis-2.4-various-similarity-measures>
#strong[Data Types and Attributes]

- What are nominal and ordinal attributes? Discuss how to handle missing
  data and noisy data during data cleaning process. \[2079 Chaitra, 6\]
- What are Categorical data? What are the possible issues arrives when
  using Categorical data? How can you handle such issues? \[2073
  Shrawan, 2+3+3\]
- How data in most real application becomes Asymmetric. Explain the
  difference between symmetric and asymmetric data. \[2073 Chaitra, 5\]
- What are the different data types? Explain with examples. \[2069
  Chaitra, 5\]

#strong[Data Pre-processing (normalization, cleaning, missing/noisy
data, dimensionality reduction, sampling)]

- Explain the significance of data normalization. Normalize the
  following group of data using two methods 200, 300, 500, 600, 1000: a)
  Min-Max normalization (min\=0, max\=1) b) Z-normalization. \[2083
  Baishakh, 2+6\]

- What is performed during data preprocessing? Discuss various
  techniques to handle missing values. \[2082 Bhadra, 4+4\]

- What do you understand by curse of dimensionality in Data Mining?
  Explain. \[2081 Bhadra, 6\]

- Write short notes on: Dimensionality Reduction. \[2081 Bhadra, 4\]

- What is Data Pre-Processing? Briefly explain the major tasks performed
  in data pre-processing. \[2081 Baishakh, 2+7\]

- Suppose that the data for analysis include the attribute the frequency
  of stop words in documents. Values in increasing order:
  13,15,16,16,19,20,20,21,22,22,25,25,25,25,30,33,33,35,35,35,35,36,40,45,46,52,70.
  \[2079 Chaitra, 6\]
  #block[
  #set enum(numbering: "a)", start: 1)
  + Use smoothing by bin means with a depth of 3.
  + Use min-max normalization to transform the value 35 into the range
    0.0–1.0.
  + Use z-score normalization to transform 35 (std dev \= 12.94).
  + Use normalization by decimal scaling to transform 35.
  ]

- Describe the working mechanism as well as the merits and demerits of
  the holdout method, random sampling, k-cross validation and bootstrap
  approaches in evaluating the performance of a classifier. #emph[(Note:
  this is a classifier-evaluation topic — see also Chapter 3 Issues)]
  \[2079 Chaitra, 8\]

- Use the following methods to normalize the data: 200, 300, 400, 600,
  1000: a) Min-max (min\=0,max\=1) b) Z-score c) Decimal scaling. \[2078
  Bhadra, 2+2+2\]

- Write short notes on: Data visualization. \[2079 Chaitra, 4\]

- What is data warehouse and data mart? Describe Snowflake scheme with
  example. \[2074 Chaitra, 2+4\]

- What are the approaches to handle missing data? \[2074 Chaitra, part
  of 2+5+3\]

- What are the measuring elements of data Quality? Explain different
  data transformation by normalization methods with an example. \[2073
  Shrawan, 2+6\]

- Write short notes on: Data transformation. \[2073 Shrawan, 4\] /
  \[2072 Kartik, 3\]

- What is data pre-processing? Explain data sampling and dimensionality
  reduction in data pre-processing with suitable example. \[2073
  Chaitra, 2+4+4\]

- Why data preprocessing is required in the data mining? Explain some of
  approaches of data clearing. \[2072 Kartik, 5+5\]

- How can principle component analysis be used for dimensionality
  reduction? \[2071 Shawan\]

- What is dimensionality reduction? Why is it important in data mining?
  \[2070 Ashad, 5\]

- #block[
  #set enum(numbering: "a)", start: 1)
  + What is "curve of Dimensionality"? How can it be avoided? b) Discuss
    the impact of noisy data in data mining? \[2070 Chaitra, 5+5\]
  ]

- In real-world data, tuples with missing values for same attributes are
  a common occurrence. Describe various methods for handling this
  problem. \[2074 Ashwin, 5\]

#strong[OLAP & Multidimensional Data Analysis]

- Explain about the schema used in data warehousing. \[2083 Baishakh,
  4\]
- Explain typical OLAP operations over a multidimensional data
  warehouse? Differentiate between OLAP and OLTP tools. \[2079 Bhadra,
  6+4\]
- Suppose that a data warehouse consists of the four dimensions data,
  spectator, location, and game, and the two measures count and charge…
  \[2078 Bhadra, 3+3\]
  #block[
  #set enum(numbering: "a)", start: 1)
  + Draw a star schema diagram for the data warehouse.
  + Starting with the base cuboid \[data, spectator, location, game\],
    what specific OLAP operations should you perform in order to list
    the total charge paid by student spectators at Dashrath Stadium in
    2021?
  ]
- What do you mean by dimensional data? What are base & apex cuboid?
  Slicing & Dicing? Roll Down and Roll Up operations? Give example.
  \[2076 Ashwin, 2+3+3+3\]
- Discuss issues to consider during Data Integration. Describe OLAP and
  operations on OLAP with suitable example. \[2075 Ashwin, 5+5\]
- Describe OLAP and operations on OLAP with suitable example.
  Differentiate between OLAP and OLTP. \[2074 Chaitra, 5+3\]
- Write short notes on: OLAP. \[2073 Shrawan, 4\]
- How do you perform analysis of multidimensional data? Explain with the
  concept of OLAP. \[2072 Chaitra, 10\]
- Write short notes on: OLAP cubes. \[2070 Ashad, 5\]
- Write short notes on: OLAP Operations. \[2074 Ashwin, 4\]

#strong[Various Similarity Measures]

- Why similarity measures are important in data mining? Discuss about
  the different similarity measures with examples. \[2081 Bhadra, 2+6\]

- How do similarity/dissimilarity is calculated? Find the cosine
  similarity between Object-2 and 4. Also calculate the Euclidean
  distance between object 1,3 and object 1,4. \[2080 Bhadra, 3+3+3\]

  #align(center)[#table(
    columns: 5,
    align: (col, row) => (auto,auto,auto,auto,auto,).at(col),
    inset: 6pt,
    [Object], [Size], [Weight], [Color Code], [Taste Score],
    [1],
    [4],
    [56],
    [7],
    [10],
    [2],
    [3],
    [53],
    [8],
    [11],
    [3],
    [7],
    [58],
    [6],
    [9],
    [4],
    [9],
    [55],
    [7],
    [12],
  )
  ]

- List down the different types of similarity measures by highlighting
  their application areas. Consider the following table and calculate
  Jaccard Coefficient, Dissimilarity of symmetric binary attributes,
  SMC, and Cosine similarity between documents. \[2080 Baishakh, 3 +
  2+2+2+1\]

  #align(center)[#table(
    columns: 8,
    align: (col, row) => (auto,auto,auto,auto,auto,auto,auto,auto,).at(col),
    inset: 6pt,
    [Name], [Gender], [Eyecolor], [Haircolor], [Test-1], [Test-2],
    [Fever], [Cough],
    [Ram],
    [M],
    [Black],
    [Gray],
    [P],
    [N],
    [P],
    [N],
    [Laxmi],
    [F],
    [Blue],
    [Black],
    [P],
    [P],
    [N],
    [N],
    [Shyam],
    [M],
    [Blue],
    [Gray],
    [N],
    [P],
    [N],
    [P],
  )
  ]

- Write short notes on: Minkowski Distance. \[2078 Bhadra, 4\]

- Explain the properties that a Distance Metric needs to support with
  respect to Minkowski’s distance. \[2071 Chaitra\]

- What are the properties of a distance metric? How is distance metric
  used in instance based classifier? \[2070 Ashad, 10\]

#horizontalrule

= Chapter 3: Classification (12 hrs)
<chapter-3-classification-12-hrs>
=== 3.1 Basics and Algorithms | 3.2 Decision Tree | 3.3 Rule Based | 3.4
Nearest Neighbor | 3.5 Bayesian | 3.6 ANN | 3.7 Issues: Overfitting,
Validation, Model Comparison
<basics-and-algorithms-3.2-decision-tree-3.3-rule-based-3.4-nearest-neighbor-3.5-bayesian-3.6-ann-3.7-issues-overfitting-validation-model-comparison>
#strong[Decision Tree Classifier]

- Why is Naïve Bayesian classification called "naïve"? Predict the class
  label for X \= {Outlook\=Sunny, Temperature\=Hot, Humidity\=Normal,
  Windy\=False} using Bayesian Classifier. #emph[(see also Bayesian
  section below; table repeated there)] \[2083 Baishakh, 2+9+3\]

- When do we use decision tree? Construct a complete decision tree using
  ID-3 algorithm for following dataset. How do you evaluate the
  performance of this model? \[2082 Bhadra, 2+9+3\]

  #align(center)[#table(
    columns: 6,
    align: (col, row) => (auto,auto,auto,auto,auto,auto,).at(col),
    inset: 6pt,
    [SN], [Credit history], [Debt], [Collateral], [Income], [Credit
    Risk],
    [1],
    [bad],
    [high],
    [none],
    [\$0 to \$15K],
    [high],
    [2],
    [unknown],
    [high],
    [none],
    [\$15 to \$35K],
    [high],
    [3],
    [unknown],
    [low],
    [none],
    [\$15 to \$35K],
    [moderate],
    [4],
    [unknown],
    [low],
    [none],
    [\$0 to \$15K],
    [high],
    [5],
    [unknown],
    [low],
    [none],
    [over \$35K],
    [low],
    [6],
    [unknown],
    [low],
    [adequate],
    [over \$35K],
    [low],
    [7],
    [bad],
    [low],
    [none],
    [\$0 to \$15K],
    [high],
    [8],
    [bad],
    [low],
    [adequate],
    [over \$35K],
    [moderate],
    [9],
    [good],
    [low],
    [none],
    [over \$35K],
    [low],
    [10],
    [good],
    [high],
    [adequate],
    [over \$35K],
    [low],
    [11],
    [good],
    [high],
    [none],
    [\$0 to \$15K],
    [high],
    [12],
    [good],
    [high],
    [none],
    [\$15 to \$35K],
    [moderate],
    [13],
    [good],
    [high],
    [none],
    [over \$35K],
    [low],
    [14],
    [bad],
    [high],
    [none],
    [\$15 to \$35K],
    [high],
  )
  ]

- State an algorithm for constructing a decision tree. Using ID3
  identify the root node for the following data set. \[2081 Bhadra,
  2+8\]

  #align(center)[#table(
    columns: 5,
    align: (col, row) => (auto,auto,auto,auto,auto,).at(col),
    inset: 6pt,
    [Gender], [Car Ownership], [Travel Cost], [Income Level], [Transport
    Mode (Target class)],
    [Male],
    [0],
    [Cheap],
    [Low],
    [Bus],
    [Male],
    [1],
    [Cheap],
    [Medium],
    [Bus],
    [Female],
    [1],
    [Cheap],
    [Medium],
    [Train],
    [Female],
    [0],
    [Cheap],
    [Low],
    [Bus],
    [Male],
    [1],
    [Cheap],
    [Medium],
    [Bus],
    [Male],
    [0],
    [Standard],
    [High],
    [Train],
    [Female],
    [1],
    [Standard],
    [Medium],
    [Train],
    [Female],
    [1],
    [Expensive],
    [Medium],
    [Car],
    [Male],
    [2],
    [Expensive],
    [Medium],
    [Car],
    [Female],
    [2],
    [Expensive],
    [High],
    [Car],
  )
  ]

- Draw decision tree for the given data using ID3 algorithm. \[2079
  Bhadra, 10\]

  #align(center)[#table(
    columns: 5,
    align: (col, row) => (auto,auto,auto,auto,auto,).at(col),
    inset: 6pt,
    [Age], [Income], [Student], [Credit Rating], [Buy’s Computer],
    [Youth],
    [High],
    [No],
    [Fair],
    [No],
    [Youth],
    [High],
    [No],
    [Excellent],
    [No],
    [Middle Aged],
    [High],
    [No],
    [Fair],
    [Yes],
    [Senior],
    [Medium],
    [No],
    [Fair],
    [Yes],
    [Senior],
    [Low],
    [Yes],
    [Fair],
    [Yes],
    [Senior],
    [Low],
    [Yes],
    [Excellent],
    [No],
    [Middle Aged],
    [Low],
    [Yes],
    [Excellent],
    [Yes],
    [Youth],
    [Medium],
    [No],
    [Fair],
    [No],
    [Youth],
    [Low],
    [Yes],
    [Fair],
    [Yes],
    [Senior],
    [Medium],
    [Yes],
    [Fair],
    [Yes],
    [Youth],
    [Medium],
    [Yes],
    [Excellent],
    [Yes],
    [Middle Aged],
    [Medium],
    [No],
    [Excellent],
    [Yes],
    [Middle Aged],
    [High],
    [Yes],
    [Fair],
    [Yes],
    [Senior],
    [Medium],
    [No],
    [Excellent],
    [No],
  )
  ]

- Construct a decision tree for the following data set using information
  gain. Predict the class label for a data point with values \<Female,
  2, standard, high\>. \[2078 Bhadra, 8\]

  #align(center)[#table(
    columns: 5,
    align: (col, row) => (auto,auto,auto,auto,auto,).at(col),
    inset: 6pt,
    [Gender], [Car ownership], [Travel cost], [Income level], [Transport
    mode],
    [Male],
    [0],
    [Cheap],
    [Low],
    [Bus],
    [Male],
    [1],
    [Cheap],
    [Medium],
    [Bus],
    [Female],
    [0],
    [Cheap],
    [Low],
    [Bus],
    [Male],
    [1],
    [Cheap],
    [Medium],
    [Bus],
    [Female],
    [1],
    [Expensive],
    [High],
    [Car],
    [Male],
    [2],
    [Expensive],
    [Medium],
    [Car],
    [Female],
    [2],
    [Expensive],
    [High],
    [Car],
    [Female],
    [1],
    [Cheap],
    [Medium],
    [Train],
    [Male],
    [0],
    [Standard],
    [Medium],
    [Train],
    [Female],
    [1],
    [Standard],
    [Medium],
    [Train],
  )
  ]

- How do you measure the accuracy of classifiers? How do you select best
  root attribute in decision tree? Explain. \[2076 Ashwin, 4+6\]

- What is a decision tree and how information gain is used for attribute
  selection? Explain with example. \[2073 Shrawan, 8\]

- What is ID3 algorithm? Calculate TPR, FPR and Accuracy for given
  confusion matrix. \[2073 Chaitra, 2+6\]

  #align(center)[#table(
    columns: 3,
    align: (col, row) => (auto,auto,auto,).at(col),
    inset: 6pt,
    [], [Predicted +], [Predicted -],
    [Predicted +],
    [100],
    [40],
    [Predicted -],
    [60],
    [300],
  )
  ]

- Write about Hunt’s Algorithm for Decision Tree induction. Explain the
  test conditions that can be used for different attribute types. \[2072
  Kartik, 10\]

- What is a decision tree? Explain Gini Index with suitable example.
  \[2071 Chaitra\]

- What is the importance of homogeneousness measure in decision tree
  classifier? Explain GINI index? \[2070 Ashad, 8\]

- How is decision tree classifier different than rule based classifier?
  \[2069 Chaitra, 8\]

- Explain decision tree with the concept of Naive base classification
  with appropriate example. \[2074 Chaitra, 10\]

#strong[Rule Based Classifier]

- What is classification? Explain Rule-Based classification with its
  classification principles with suitable example. \[2074 Ashwin, 2+8\]
- How does Rule Based Classifier work? Explain with suitable example.
  \[2080 Bhadra, 7\]
- Explain rule based classifier? How can CN2 Algorithm be used for rule
  based classification? Define "Accuracy" and "Laplace" measures used
  for rule evaluation. \[2070 Chaitra, 9\]

#strong[Nearest Neighbor Classifier]

- What is nearest neighbor classifier? When do we use this classifier?
  Explain with an example by stating it’s algorithm. \[2081 Bhadra,
  2+4\]

- When do we use classifier? Classify the given flower using KNN
  algorithm for K\=3 with Euclidean distance matrix. \[2080 Bhadra,
  3+6\]

  #align(center)[#table(
    columns: 6,
    align: (col, row) => (auto,auto,auto,auto,auto,auto,).at(col),
    inset: 6pt,
    [Id], [Sepal Length], [Sepal Width], [Petal Length], [Petal Width],
    [Label],
    [1],
    [5.1],
    [3.5],
    [1.4],
    [0.2],
    [setosa],
    [2],
    [4.9],
    [3],
    [1.4],
    [0.2],
    [setosa],
    [3],
    [4.7],
    [3.2],
    [1.3],
    [0.2],
    [setosa],
    [4],
    [6],
    [2.2],
    [4],
    [1],
    [versicolor],
    [5],
    [6.1],
    [2.9],
    [4.7],
    [1.4],
    [versicolor],
    [6],
    [5.6],
    [2.9],
    [3.6],
    [1.3],
    [versicolor],
    [7],
    [6.7],
    [3.1],
    [4.4],
    [1.4],
    [versicolor],
  )
  ]

- What is Nearest Neighbor Classifier? What are the main issues with
  this classifier? Propose another classifier that solves the issues.
  \[2080 Baishakh, 1+3+4\]

- How can Nearest-Neighbor algorithm be used for anomaly detection?
  #emph[(cross-topic — see also Chapter 6)] \[2071 Shawan\]

#strong[Bayesian Classifier]

- Why is Naïve Bayesian classification called "naïve"? Predict the class
  label for X \= {Outlook\=Sunny, Temperature\=Hot, Humidity\=Normal,
  Windy\=False} using Bayesian Classifier. How do you evaluate the
  performance of this model? \[2083 Baishakh, 2+9+3\]

  #align(center)[#table(
    columns: 5,
    align: (col, row) => (auto,auto,auto,auto,auto,).at(col),
    inset: 6pt,
    [Outlook], [Temperature], [Humidity], [Windy], [Play Golf],
    [Rainy],
    [Hot],
    [High],
    [False],
    [No],
    [Rainy],
    [Hot],
    [High],
    [True],
    [No],
    [Overcast],
    [Hot],
    [High],
    [False],
    [Yes],
    [Sunny],
    [Mild],
    [High],
    [False],
    [Yes],
    [Sunny],
    [Cool],
    [Normal],
    [False],
    [Yes],
    [Sunny],
    [Cool],
    [Normal],
    [True],
    [No],
    [Overcast],
    [Cool],
    [Normal],
    [True],
    [Yes],
    [Rainy],
    [Mild],
    [High],
    [False],
    [No],
    [Rainy],
    [Cool],
    [Normal],
    [False],
    [Yes],
    [Sunny],
    [Mild],
    [Normal],
    [False],
    [Yes],
    [Rainy],
    [Mild],
    [Normal],
    [True],
    [Yes],
    [Overcast],
    [Mild],
    [High],
    [True],
    [Yes],
    [Overcast],
    [Hot],
    [Normal],
    [False],
    [Yes],
    [Sunny],
    [Mild],
    [High],
    [True],
    [No],
  )
  ]

- What is limitation of Naive Bayes and how Bayesian Belief Networks
  overcomes it? If a person does exercise, eats an unhealthy diet and
  has blood pressure but no chest pain, will that person has a heart
  disease? \[2081 Baishakh, 3+5\]

  Bayesian network: #strong[Exercise] and #strong[Diet] → #strong[Heart
  Disease] → #strong[Chest Pain], #strong[Blood Pressure]

  #align(center)[#table(
    columns: 5,
    align: (col, row) => (auto,auto,auto,auto,auto,).at(col),
    inset: 6pt,
    [Exercise\=Yes], [0.7], [], [Diet\=Healthy], [0.25],
    [Exercise\=No],
    [0.3],
    [],
    [Diet\=Unhealthy],
    [0.75],
  )
  ]

  #align(center)[#table(
    columns: 5,
    align: (col, row) => (auto,auto,auto,auto,auto,).at(col),
    inset: 6pt,
    [HD given (E,D)], [E\=Yes,D\=Healthy], [E\=Yes,D\=Unhealthy],
    [E\=No,D\=Healthy], [E\=No,D\=Unhealthy],
    [HD\=Yes],
    [0.25],
    [0.45],
    [0.55],
    [0.75],
    [HD\=No],
    [0.75],
    [0.55],
    [0.45],
    [0.25],
  )
  ]

  #align(center)[#table(
    columns: 3,
    align: (col, row) => (auto,auto,auto,).at(col),
    inset: 6pt,
    [], [HD\=Yes], [HD\=No],
    [CP\=Yes],
    [0.8],
    [0.01],
    [CP\=No],
    [0.2],
    [0.99],
  )
  ]

  #align(center)[#table(
    columns: 3,
    align: (col, row) => (auto,auto,auto,).at(col),
    inset: 6pt,
    [], [HD\=Yes], [HD\=No],
    [BP\=High],
    [0.85],
    [0.2],
    [BP\=Low],
    [0.15],
    [0.8],
  )
  ]

- Suppose you have a test record "X \= (Home Owner \= No, Marital Status
  \= Married, Income \= \$120K)". Classify using Naive Bayesian
  Classification. \[2079 Bhadra, 6\]

  #align(center)[#table(
    columns: 5,
    align: (col, row) => (auto,auto,auto,auto,auto,).at(col),
    inset: 6pt,
    [Tid], [Home Owner], [Marital Status], [Annual Income], [Defaulted
    Borrower],
    [1],
    [Yes],
    [Single],
    [125K],
    [No],
    [2],
    [No],
    [Married],
    [100K],
    [No],
    [3],
    [No],
    [Single],
    [70K],
    [No],
    [4],
    [Yes],
    [Married],
    [120K],
    [No],
    [5],
    [No],
    [Divorced],
    [95K],
    [Yes],
    [6],
    [No],
    [Married],
    [60K],
    [No],
    [7],
    [Yes],
    [Divorced],
    [220K],
    [No],
    [8],
    [No],
    [Single],
    [85K],
    [Yes],
    [9],
    [No],
    [Married],
    [75K],
    [No],
    [10],
    [No],
    [Single],
    [90K],
    [Yes],
  )
  ]

- Explain Naive Baiyesian classification algorithm with suitable
  example. \[2078 Bhadra, 6\]

- What are prior and posterior probabilities? Explain the algorithmic
  steps of Bayesian classifier and write its strengths. \[2076 Ashwin,
  3+7\]

- Explain Naïve Bayesian classification with suitable example. \[2075
  Ashwin, 8\]

- Predict Class label using naive Bayesian classifier for
  X\=(age\=youth, income\=medium, student\=yes, credit-rating\=fair).
  \[2072 Chaitra, 10\]

  #align(center)[#table(
    columns: 6,
    align: (col, row) => (auto,auto,auto,auto,auto,auto,).at(col),
    inset: 6pt,
    [RID], [Age], [Income], [Student], [Credit-rating], [Class Buy
    computer],
    [1],
    [Youth],
    [High],
    [No],
    [Fair],
    [No],
    [2],
    [Youth],
    [High],
    [No],
    [Excellent],
    [No],
    [3],
    [Middle-age],
    [High],
    [No],
    [Fair],
    [Yes],
    [4],
    [Senior],
    [Medium],
    [No],
    [Fair],
    [Yes],
    [5],
    [Senior],
    [Low],
    [Yes],
    [Fair],
    [Yes],
    [6],
    [Senior],
    [Low],
    [Yes],
    [Excellent],
    [No],
    [7],
    [Middle-age],
    [Low],
    [Yes],
    [Excellent],
    [Yes],
    [8],
    [Youth],
    [Medium],
    [No],
    [Fair],
    [No],
    [9],
    [Youth],
    [Low],
    [Yes],
    [Fair],
    [Yes],
    [10],
    [Senior],
    [Medium],
    [Yes],
    [Fair],
    [Yes],
    [11],
    [Youth],
    [Medium],
    [Yes],
    [Excellent],
    [Yes],
    [12],
    [Middle-age],
    [Medium],
    [No],
    [Excellent],
    [Yes],
    [13],
    [Middle-age],
    [High],
    [Yes],
    [Fair],
    [Yes],
    [14],
    [Senior],
    [Medium],
    [No],
    [Excellent],
    [No],
  )
  ]

- Explain a Bayes classifier. In what cases can Naive Bayes and Bayesian
  Belief Network be used? \[2071 Chaitra\]

- Explain Naive Bayes classifier. How can overfitting problem be solved
  in case of classification? \[2071 Shawan\]

- Explain Baye’s Theorem. How can it be used for classification? Explain
  how Naive Baye’s simplifies the computational complexity of Baye’s
  classification algorithm. \[2069 Chaitra, 12\]

- Write short notes on: Laplacian Correction in Classification method.
  \[2078 Bhadra, 4\]

#strong[Artificial Neural Network Classifier]

- How does Neural Net work classified work? Explain with suitable
  example. \[2081 Baishakh, 8\]
- Write short notes on: Neural Network Classifier. \[2082 Bhadra, 5\] /
  \[2080 Baishakh, 5\]
- What is an ANN classifier? Explain its general consideration that
  required for the classifier. \[2072 Kartik, 2+6\]

#strong[Issues: Overfitting, Validation, Model Comparison (accuracy,
confusion matrix, ROC etc.)]

- In what cases you cannot use Accuracy for performance measure?
  Calculate Classification error, Sensitivity, False alarm rate,
  Specificity from confusion matrix. \[2080 Baishakh, 3+5\]

  #align(center)[#table(
    columns: 3,
    align: (col, row) => (auto,auto,auto,).at(col),
    inset: 6pt,
    [Predicated  Actual], [True], [False],
    [True],
    [1050],
    [250],
    [False],
    [150],
    [950],
  )
  ]

- Describe the working mechanism as well as the merits and demerits of
  the holdout method, random sampling, k-cross validation and bootstrap
  approaches in evaluating the performance of a classifier. \[2079
  Chaitra, 8\]

- Given the following confusion matrix, determine Accuracy, Error rate,
  Sensitivity, Specificity, Precision, Recall of the classifier model.
  \[2079 Chaitra, 4\]

  #align(center)[#table(
    columns: 4,
    align: (col, row) => (auto,auto,auto,auto,).at(col),
    inset: 6pt,
    [n \= 165], [Predicted: NO], [Predicted: YES], [],
    [Actual NO],
    [TN \= 50],
    [FP \= 10],
    [60],
    [Actual YES],
    [FN \= 5],
    [TP \= 100],
    [105],
    [],
    [55],
    [110],
    [],
  )
  ]

- Calculate: Accuracy, TPR, FPR and Precision for the given confusion
  matrix for a classifier. \[2078 Bhadra, 4\]

  #align(center)[#table(
    columns: 3,
    align: (col, row) => (auto,auto,auto,).at(col),
    inset: 6pt,
    [Predicted Class  Actual Class], [Class 1], [Class 2],
    [Class 1],
    [142],
    [40],
    [Class 2],
    [98],
    [720],
  )
  ]

- Compare and contrast among three difference methods of anomaly
  detection. #emph[(cross-topic — see Ch.6)]

- Write short notes on: Overfitting problem in classification. \[2078
  Bhadra, 4\]

- The confusion matrix for a classifier is given as follows. Calculate:
  Accuracy, Sensitivity, Specificity and Precision. \[2075 Ashwin, 10\]

  #align(center)[#table(
    columns: 3,
    align: (col, row) => (auto,auto,auto,).at(col),
    inset: 6pt,
    [Actual Class  Predicted Class], [Class 1], [Class 2],
    [Class 1],
    [21],
    [6],
    [Class 2],
    [7],
    [41],
  )
  ]

- The confusion matrix for a classifier is given as follows. Calculate:
  Accuracy, Sensitivity, Specificity, Precision. \[2074 Ashwin, 10\]

  #align(center)[#table(
    columns: 3,
    align: (col, row) => (auto,auto,auto,).at(col),
    inset: 6pt,
    [Actual Class  Predicted Class], [Class 1], [Class 2],
    [Class 1],
    [25],
    [9],
    [Class 2],
    [4],
    [31],
  )
  ]

- Draw clear block diagram depicting different stages in classification.
  Explain the inverse relation between precision and recall. Given the
  confusion matrix, determine accuracy, sensitivity and precision.
  \[2074 Chaitra, 2+3+5\]

  #align(center)[#table(
    columns: 3,
    align: (col, row) => (auto,auto,auto,).at(col),
    inset: 6pt,
    [Actual  Predicted], [Positive], [Negative],
    [Positive],
    [142],
    [40],
    [Negative],
    [98],
    [720],
  )
  ]

- Explain ROC. Using the following data, calculate TPR, FPR, precision
  for given confusion matrix. Classify, A\=Yes, B\=No. \[2073 Shrawan,
  1+3+6\]

  #align(center)[#table(
    columns: 3,
    align: (col, row) => (auto,auto,auto,).at(col),
    inset: 6pt,
    [Predicted  Actual], [A], [B],
    [A],
    [20],
    [5],
    [B],
    [10],
    [40],
  )
  ]

- Write short notes on: Overfitting and ROC. \[2073 Chaitra, 4\]

- The confusion matrix for a classifier is given as follows. Calculate
  accuracy, sensitivity, specificity, precision, recall. \[2072 Chaitra,
  10\]

  #align(center)[#table(
    columns: 3,
    align: (col, row) => (auto,auto,auto,).at(col),
    inset: 6pt,
    [Predicted  Actual], [class1], [class2],
    [class1],
    [21],
    [6],
    [class2],
    [7],
    [41],
  )
  ]

- An input sequence "A A B B B A A A B B" was used for classification by
  two classifiers X and Y. Develop the corresponding confusion matrix
  and find Accuracy, Precision, TPR, FPR. \[2070 Chaitra, 10\]

- What is Base Rate Fallacy? Explain with example. \[2069 Chaitra, 7\]

- The confusion matrix for a classifier is given as follows. Calculate:
  Accuracy, Sensitivity, Specificity, Precision, Recall. \[2072 Chaitra,
  10\]

- The confusion matrix for a classifier is given as follows. Calculate:
  a) Accuracy b) Sensitivity c) Specificity d) Precision. \[2074 Ashwin,
  10\]

#horizontalrule

= Chapter 4: Association Analysis (10 hrs)
<chapter-4-association-analysis-10-hrs>
=== 4.1 Basics and Algorithms | 4.2 Frequent Itemset Pattern & Apriori |
4.3 FP-Growth, FP-Tree | 4.4 Handling Categorical Attributes | 4.5
Sequential, Subgraph, Infrequent Patterns
<basics-and-algorithms-4.2-frequent-itemset-pattern-apriori-4.3-fp-growth-fp-tree-4.4-handling-categorical-attributes-4.5-sequential-subgraph-infrequent-patterns>
#strong[Basics / Support & Confidence]

- Explain the term support and confidence in association analysis.
  Derive association rule for following transaction (min support\=60%,
  confidence\=70%) using apriori algorithm. \[2083 Baishakh, 2+8\]

  #align(center)[#table(
    columns: 2,
    align: (col, row) => (auto,auto,).at(col),
    inset: 6pt,
    [TID], [Items],
    [1],
    [Bread, Butter, Beer],
    [2],
    [Milk, Diaper],
    [3],
    [Bread, Butter, Milk, Diaper],
    [4],
    [Bread, Beer, Diaper],
    [5],
    [Beer, Diaper],
  )
  ]

- Explain the term support and confidence in association analysis.
  Derive association rule for following transaction (min support\=60%,
  confidence\=80%) using Apriori Algorithm. \[2082 Bhadra, 2+8\]

  #align(center)[#table(
    columns: 2,
    align: (col, row) => (auto,auto,).at(col),
    inset: 6pt,
    [TID], [Transaction],
    [T1],
    [A, B, C, D, E, F],
    [T2],
    [B, C, D, E, F, G],
    [T3],
    [A, D, E, H],
    [T4],
    [A, D, F, I, J],
    [T5],
    [B, D, E, K],
  )
  ]

- What is Association Analysis? Explain with different use cases. Use
  the Apriori algorithm to find the frequent itemsets. Assume minimum
  support count is 4 and confidence is 80%. \[2080 Bhadra, 2+7\]

  #align(center)[#table(
    columns: 2,
    align: (col, row) => (auto,auto,).at(col),
    inset: 6pt,
    [TID], [Items],
    [T100],
    [F, A, C, D, G, I, M, P, N],
    [T101],
    [A, B, C, D, F, L, M, O, P],
    [T102],
    [B, F, H, V, J, O, P],
    [T103],
    [B, C, K, S, A, V],
    [T104],
    [L, A, F, C, E, P, M, N, V],
    [T105],
    [I, B, A, P, S, M],
    [T106],
    [F, A, C, I, B, A, P],
  )
  ]

- Where is association analysis applicable and beneficial for us?
  Elaborate FP Growth Method Algorithm with examples. \[2080 Baishakh,
  2+6\]

- What is the importance of SUPPORT and CONFIDENCE during association
  analysis? Explain FP-Growth method with example. \[2072 Chaitra, 10\]

- What is an association analysis? Explain its importance in
  market-basket analysis. \[2072 Kartik, 2+5\]

- What are association rules? How can apriori algorithm be used to
  generate association rules? \[2071 Shawan\]

- What are association rules? Explain its importance with example.
  \[2070 Ashad, 6\]

- Why is pattern evaluation important in association rule mining?
  Explain with example the statistical based measures used for measuring
  interestingness of association rules. \[2070 Chaitra, 8\]

#strong[Apriori Algorithm / Frequent Itemsets]

- For the transaction given below, consider Confidence\=65%, minimum
  support\=50%. Identify frequent itemsets with possible association
  rules using Apriori Algorithm. \[2081 Bhadra, 2+6\]

  #align(center)[#table(
    columns: 2,
    align: (col, row) => (auto,auto,).at(col),
    inset: 6pt,
    [TID], [Items],
    [1],
    [MILK, BREAD, CAKE],
    [2],
    [BUTTER, BREAD, EGG],
    [3],
    [MILK, BUTTER, BREAD, EGG],
    [4],
    [BUTTER, EGG],
  )
  ]

- Identify the candidate and large item sets using Apriori algorithm
  with minimum support 2. \[2080 Baishakh, 4+5\]

  #align(center)[#table(
    columns: 2,
    align: (col, row) => (auto,auto,).at(col),
    inset: 6pt,
    [TID], [Items],
    [10],
    [A, C, D],
    [20],
    [B, C, E],
    [30],
    [A, B, C, E],
    [40],
    [B, E],
  )
  ]

- Derive association rule for the following market basket transactions.
  Min support\=50%, Min confidence\=80% \[2079 Bhadra, 8\]

  #align(center)[#table(
    columns: 2,
    align: (col, row) => (auto,auto,).at(col),
    inset: 6pt,
    [Transaction ID], [Item Set],
    [1],
    [A, B],
    [2],
    [A, D],
    [3],
    [A, C],
    [4],
    [B, E],
    [5],
    [B, D, E],
    [6],
    [A, E, C],
  )
  ]

- Write Apriori algorithm and using the algorithm find all the frequent
  itemset for the following database (min\_sup\=20%). Is it possible to
  generate any rules considering any value of confidence threshold?
  \[2079 Chaitra, 5+3\]

  #align(center)[#table(
    columns: 10,
    align: (col, row) => (auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,).at(col),
    inset: 6pt,
    [TID], [A1], [A2], [A3], [A4], [A5], [A6], [A7], [A8], [A9],
    [T2],
    [0],
    [1],
    [0],
    [1],
    [0],
    [0],
    [0],
    [1],
    [0],
    [T3],
    [0],
    [0],
    [0],
    [1],
    [1],
    [0],
    [0],
    [0],
    [0],
    [T4],
    [0],
    [0],
    [1],
    [1],
    [1],
    [0],
    [0],
    [0],
    [0],
    [T5],
    [0],
    [0],
    [0],
    [1],
    [1],
    [1],
    [1],
    [0],
    [0],
    [T6],
    [0],
    [1],
    [1],
    [1],
    [0],
    [0],
    [1],
    [0],
    [0],
    [T7],
    [0],
    [1],
    [0],
    [1],
    [0],
    [1],
    [1],
    [0],
    [0],
    [T8],
    [0],
    [0],
    [0],
    [0],
    [1],
    [0],
    [0],
    [0],
    [0],
  )
  ]

- For the transactions given below, consider confidence\=60%, minimum
  support\=30%. Identify large itemsets (L-Itemset) at L\=3 using
  A-priori algorithm and generate F-List using FP-Growth. \[2076 Ashwin,
  12\]

  #align(center)[#table(
    columns: 2,
    align: (col, row) => (auto,auto,).at(col),
    inset: 6pt,
    [Transactions], [Items description],
    [T1],
    [A, B, C, T, M, P, D, K],
    [T2],
    [A, B, T, P, D, K],
    [T3],
    [B, C, T, D, M, A, P],
    [T4],
    [A, C, T, M, D],
    [T5],
    [A, C, D, K, M],
    [T6],
    [B, C, T],
  )
  ]

- Why association analysis is required in data mining? Explain Apriori
  principle with example. \[2075 Ashwin, 2+6\] / \[2074 Chaitra, 2+6\]

- Identify the candidate, frequent item sets and association rules using
  Apriori algorithm. Min support\=20%, min confidence 80%. \[2074
  Ashwin, 8\]

  #align(center)[#table(
    columns: 2,
    align: (col, row) => (auto,auto,).at(col),
    inset: 6pt,
    [TID], [ITEMS],
    [1],
    [M1, M2, M5],
    [2],
    [M2, M4],
    [3],
    [M2, M3],
    [4],
    [M1, M2, M4],
    [5],
    [M1, M3],
    [6],
    [M2, M3],
    [7],
    [M1, M3],
    [8],
    [M1, M2, M3, M5],
    [9],
    [M1, M2, M3],
  )
  ]

- Explain Apriori algorithm in market basket analysis? Derive
  association rule from the following market basket transactions with
  50% minimum support and confidence. \[2073 Chaitra, 3+7\]

  #align(center)[#table(
    columns: 2,
    align: (col, row) => (auto,auto,).at(col),
    inset: 6pt,
    [Transaction], [Itemsets],
    [1],
    [A, B, C],
    [2],
    [A, C],
    [3],
    [A, D],
    [4],
    [B, E, F],
  )
  ]

- What is the use of Apriori Algorithm in market basket analysis?
  Explain with suitable example. \[2072 Chaitra, 10\]

- How does Apriori Algorithm optimize the brute force approach for
  frequent item set generation? \[2071 Chaitra\] / \[2071 Shawan
  (contiguous framing)\]

- Explain Apriori algorithm. Use Apriori to generate frequent item sets
  with support of 50% for the following transaction database. \[2070
  Chaitra, 10\]

  #align(center)[#table(
    columns: 2,
    align: (col, row) => (auto,auto,).at(col),
    inset: 6pt,
    [TID], [Items],
    [1],
    [A, C, D],
    [2],
    [B, D],
    [3],
    [A, B, C, E],
    [4],
    [B, D, F],
  )
  ]

- What is frequent item set mining? How do Apriori and FP-growth
  algorithm optimize the brute force approach for finding frequent item
  sets? \[2069 Chaitra, 15\]

- How can Apriori Algorithm be used for finding association rules out of
  a frequent item set? \[2069 Chaitra, 7\]

#strong[FP-Growth / FP-Tree]

- What is limitation of Apriori algorithm compared to FP-growth? A
  database has 5 transactions (min support\=60%, min confidence\=80%).
  Find all frequent itemsets using FP-growth; list strong association
  rules. \[2081 Baishakh, 2+7\]

  #align(center)[#table(
    columns: 2,
    align: (col, row) => (auto,auto,).at(col),
    inset: 6pt,
    [TID], [Item bought],
    [T100],
    [M, O, N, K, E, Y],
    [T200],
    [D, O, N, K, E, Y],
    [T300],
    [M, A, K, E],
    [T400],
    [M, U, C, K, Y],
    [T500],
    [C, O, O, K, I, E],
  )
  ]

- What are the advantages of FP-Growth Algorithm over Apriori Algorithm?
  Explain FP-Growth Algorithm with suitable example. \[2081 Bhadra,
  2+6\]

- What is FP-Growth Algorithm? Explain FP-Growth Algorithm with example.
  \[2080 Bhadra, 2+5\]

- Write short notes on: FP-Tree. \[2079 Bhadra, 5\]

- How does FP growth approach generate frequent item sets without
  generating candidate item sets? Explain with an example. \[2079
  Chaitra, 6\]

- Consider the given transactional database from a grocery store.
  Support threshold\=33.34%, confidence\=60%. Build FP-Tree; discover
  frequent itemsets using FP-Growth. \[2078 Bhadra, 4+4\]

  #align(center)[#table(
    columns: 2,
    align: (col, row) => (auto,auto,).at(col),
    inset: 6pt,
    [Transaction ID], [Items],
    [T1],
    [HotDogs, Buns, Ketchup],
    [T2],
    [HotDogs, Buns],
    [T3],
    [HotDogs, Coke, Chips],
    [T4],
    [Chips, Coke],
    [T5],
    [Chips, Ketchup],
    [T6],
    [HotDogs, Coke, Chips],
  )
  ]

- What are the advantages of FP growth method? Explain FP growth
  algorithm. \[2075 Ashwin, 2+6\]

- Explain FP-Growth algorithm with example. \[2074 Ashwin, 8\]

- How does FP growth approach overcomes the disadvantages of Apriori
  algorithm. Generate FP-Tree. \[2074 Chaitra, 2+8\]

  #align(center)[#table(
    columns: 2,
    align: (col, row) => (auto,auto,).at(col),
    inset: 6pt,
    [Transaction ID], [Item set],
    [T1],
    [Camera, Laptop, Pen drive],
    [T2],
    [Laptop, Pen drive],
    [T3],
    [Laptop, Mobile, Earphone],
    [T4],
    [Earphone, Mobile],
    [T5],
    [Camera, Earphone],
    [T6],
    [Laptop, Mobile, Earphone],
  )
  ]

- What is FP Tree? How FP-growth algorithm eliminate the problem of
  Apriori algorithm? Construct FP tree and find association rules.
  Support\=30%, confidence\=75%. \[2073 Shrawan, 10\]

  #align(center)[#table(
    columns: 2,
    align: (col, row) => (auto,auto,).at(col),
    inset: 6pt,
    [Transaction ID], [Items],
    [1],
    [P, R, S],
    [2],
    [R, S, T],
    [3],
    [P, Q, R],
    [4],
    [P, R, S, T],
    [5],
    [P, S, T],
    [6],
    [P, Q, T],
    [7],
    [Q, S, T],
    [8],
    [Q, R, T],
  )
  ]

- What is the use of FP-Growth method in market basket analysis? Explain
  FP-Growth method with a suitable example. \[2073 Chaitra, 10\]

- What is a Frequent item set? Explain FP growth method with example.
  \[2072 Kartik, 1+8\]

- Explain FP-growth algorithm in detail. \[2071 Shawan\] / \[2070 Ashad,
  12\]

- Write short notes on: Page Rank algorithm / FP-Tree — #emph[(FP-Tree
  portion only; Page Rank is Ch.7)] \[2079 Bhadra, 5\]

#strong[Handling Categorical Attributes / Sequential, Subgraph,
Infrequent Patterns]

- How do you handle the categorical attributes in data mining process?
  Explain with example. Generate at least four subsequences from \<
  {2,3,5}, {6,7,8}, {9,1}, {7,4} \>. \[2079 Bhadra, 3+3\]
- What are subgraph patterns? \[2079 Bhadra, 2\]
- What is Base Rate Fallacy… #emph[(see Ch.3)] — categorical data and
  related issues. \[2072 Chaitra, part of short notes\]
- Explain Sequential Pattern and Sub-graph Pattern with suitable
  example. \[2073 Chaitra, 4+4\]
- Write short notes on: AprioriALL: Sequential pattern mining algorithm.
  \[2076 Ashwin, 3\]
- Write short notes on: Sequential pattern. \[2072 Kartik, 3\]

#horizontalrule

= Chapter 5: Cluster Analysis (9 hrs)
<chapter-5-cluster-analysis-9-hrs>
=== 5.1 Basics and Algorithms | 5.2 K-means | 5.3 Hierarchical | 5.4
DBSCAN | 5.5 Issues: Evaluation, Scalability, Comparison
<basics-and-algorithms-5.2-k-means-5.3-hierarchical-5.4-dbscan-5.5-issues-evaluation-scalability-comparison>
#strong[Basics]

- Discuss about the clustering, it’s types and use cases. Explain about
  the generic philosophy of evaluating clustering approaches. \[2083
  Baishakh, 4+4\]
- What is Cluster Analysis? What are its applications? Explain different
  types of clusters. \[2081 Baishakh, 8\]
- When do we use clustering? How do you evaluate the cluster generated?
  \[2080 Bhadra, 3+4\]
- An internet marketer is interested in segmenting internet users… Which
  clustering algorithm can be used for segmentation? How do you validate
  the cluster which has been created? \[2079 Bhadra, 2+6\]
- What is a cluster analysis? How it is different from classification?
  \[2072 Kartik, 5\]
- How clustering differ from classification? \[2073 Chaitra, 4\]
- Why is a clustering an unsupervised learning? \[2071 Chaitra\]
- Describe the difference between Hierarchical and partitioning
  clustering. \[2074 Chaitra, 2\]

#strong[K-means Clustering]

- Describe the K-means clustering algorithm. Generate two clusters from
  following dataset using K-means clustering. \[2082 Bhadra, 2+8\]

  #align(center)[#table(
    columns: 3,
    align: (col, row) => (auto,auto,auto,).at(col),
    inset: 6pt,
    [Instance], [A], [B],
    [1],
    [1],
    [2],
    [2],
    [1.5],
    [1],
    [3],
    [3.5],
    [1.5],
    [4],
    [4],
    [3],
    [5],
    [3.5],
    [2.5],
    [6],
    [6],
    [4],
  )
  ]

- Consider the data points {(2,3),(3,3),(6,8),(8,8),(7,5)} with initial
  centroid (2,3). Apply K-means to choose the next centroid, cluster
  into k\=2. Discuss problems with K-means and how to solve them. \[2081
  Bhadra, 5+3\]

- Use K-means clustering to cluster the following given data for K\=2
  with Euclidean distance matrix. List demerits. \[2081 Baishakh, 5+3\]

- Describe K-means algorithm for clustering and discuss strategy in
  determining the optimal value of K. \[2080 Baishakh, 4+4\]

- Define clustering. Perform K-means clustering using Manhattan
  distance. Centers initiated as A(6.2,3.2), B(6.6,3.7), C(6.5,3.0).
  Provide final centers after 3 iterations. \[2079 Chaitra, 8\]

  #align(center)[#table(
    columns: 10,
    align: (col, row) => (auto,auto,auto,auto,auto,auto,auto,auto,auto,auto,).at(col),
    inset: 6pt,
    [5.9], [4.6], [6.2], [4.7], [5.5], [5.0], [4.9], [6.7], [5.1],
    [6.0],
    [3.2],
    [2.9],
    [2.8],
    [3.2],
    [4.2],
    [3.0],
    [3.1],
    [3.1],
    [3.8],
    [3.0],
  )
  ]

- Write K-means clustering algorithm. Generate two clusters from
  following dataset using K-means clustering. \[2078 Bhadra, 2+6\]

  #align(center)[#table(
    columns: 3,
    align: (col, row) => (auto,auto,auto,).at(col),
    inset: 6pt,
    [Instance], [A], [B],
    [1],
    [1],
    [2],
    [2],
    [2.5],
    [1],
    [3],
    [3.5],
    [1.5],
    [4],
    [4],
    [1],
    [5],
    [3.5],
    [2.5],
    [6],
    [5],
    [3],
  )
  ]

- Explain K-means clustering with limitation. Generate two clusters from
  following dataset using K-means clustering. \[2075 Ashwin, 4+6\]

  #align(center)[#table(
    columns: 2,
    align: (col, row) => (auto,auto,).at(col),
    inset: 6pt,
    [A], [B],
    [1],
    [2],
    [2.5],
    [4.5],
    [4],
    [6],
    [3.5],
    [4],
    [4],
    [5.5],
    [3],
    [6],
  )
  ]

- Write K-means algorithm and find clusters for following data set.
  (Take K\=2) \[2074 Ashwin, 2+8\]

  #align(center)[#table(
    columns: 3,
    align: (col, row) => (auto,auto,auto,).at(col),
    inset: 6pt,
    [Instance], [X], [Y],
    [1],
    [1.0],
    [2.0],
    [2],
    [2.5],
    [1.0],
    [3],
    [3.5],
    [1.5],
    [4],
    [4.0],
    [1.0],
    [5],
    [3.5],
    [2.5],
    [6],
    [5.0],
    [3.0],
  )
  ]

- How K-means clustering is applied? Verify using example. \[2074
  Chaitra, 8\]

- Given one-dimensional points {5,12,18,24,30,42,48} with initial
  centroids {5,12,18}, create three clusters by K-Means algorithm and
  calculate SSE. \[2073 Chaitra, 4+8\]

- Explain K-means clustering with limitation. Use k-means clustering to
  cluster the following dataset. \[2071 Shawan\]

  #align(center)[#table(
    columns: 2,
    align: (col, row) => (auto,auto,).at(col),
    inset: 6pt,
    [A], [B],
    [1.0],
    [1.0],
    [1.5],
    [2.0],
    [3.0],
    [4.0],
    [5.0],
    [7.0],
    [3.5],
    [5.0],
    [4.5],
    [5.0],
    [3.5],
    [4.5],
  )
  ]

- Explain K-means clustering algorithm with examples. \[2069 Chaitra,
  10\]

- What is contiguous cluster? Explain an algorithm that can be used to
  generate contiguous clusters. \[2071 Shawan\]

- Write short notes on: Convex Hull Method. \[2070 Chaitra, part of 15\]

#strong[Hierarchical Clustering]

- What is hierarchical clustering? Use this clustering approach to draw
  dendrogram for given data points. \[2080 Bhadra, 2+7\]

  #align(center)[#table(
    columns: 7,
    align: (col, row) => (auto,auto,auto,auto,auto,auto,auto,).at(col),
    inset: 6pt,
    [], [p1], [p2], [p3], [p4], [p5], [p6],
    [p1],
    [0.00],
    [0.24],
    [0.22],
    [0.37],
    [0.34],
    [0.23],
    [p2],
    [0.24],
    [0.00],
    [0.15],
    [0.20],
    [0.14],
    [0.25],
    [p3],
    [0.22],
    [0.15],
    [0.00],
    [0.15],
    [0.28],
    [0.11],
    [p4],
    [0.37],
    [0.20],
    [0.15],
    [0.00],
    [0.29],
    [0.22],
    [p5],
    [0.34],
    [0.14],
    [0.28],
    [0.29],
    [0.00],
    [0.39],
    [p6],
    [0.23],
    [0.25],
    [0.11],
    [0.22],
    [0.39],
    [0.00],
  )
  ]

- Cluster the following samples based on complete-linkage algorithm and
  draw the dendrogram (Euclidean distance). \[2080 Baishakh, 8\]

  #align(center)[#table(
    columns: 3,
    align: (col, row) => (auto,auto,auto,).at(col),
    inset: 6pt,
    [Point], [x Coordinate], [y Coordinate],
    [p1],
    [0.40],
    [0.53],
    [p2],
    [0.22],
    [0.38],
    [p3],
    [0.35],
    [0.32],
    [p4],
    [0.26],
    [0.19],
    [p5],
    [0.08],
    [0.41],
    [p6],
    [0.45],
    [0.30],
  )
  ]

- Explain hierarchical clustering method with an example of Dendogram
  plot. \[2079 Chaitra, 6\]

- List the various types of partition based clustering methods. Explain
  Hierarchical clustering method with an example. \[2074 Ashwin, 10\]

- How is hierarchical clusters generated using Bisecting K-means
  algorithm? \[2071 Chaitra\]

- What is Hierarchical Clustering? Differentiate between agglomerative
  and divisive approach. Illustrate with examples. \[2070 Chaitra, 10\]

#strong[DBSCAN Clustering]

- What are core, border and noise points? Consider the following points
  (2,10),(2,5),(8,4),(5,8),(7,5),(6,4),(1,2),(4,9). Use DBSCAN with
  ε\=2, minPts\=2. \[2082 Bhadra, 3+5\]
- What are core, border and noise points? Write the algorithm of DBSCAN
  clustering and explain how it is useful in handling the noisy data.
  \[2079 Bhadra, 3+5\]
- Provide answers regarding DBSCAN: neighborhood quantification, cluster
  finding, Epsilon/MinPts determination, and subset proof for Epsilon1
  \< Epsilon2. \[2078 Bhadra, 2+2+2\]
- How DBSCAN algorithm works? How do we avoid the issues of DBSCAN?
  \[2076 Ashwin, 8+2\]
- What are outliers? Explain an algorithm that can be used to generate
  density based clusters (DBSCAN). \[2075 Ashwin, 8\]
- Explain a DBSCAN algorithm with example. \[2072 Kartik, 7\]
- What are the types of clustering methods? Explain DBSCAN method of
  clustering with an example. \[2072 Chaitra, 10\]
- What are density based clusters? Explain DBSCAN clustering algorithm
  with example. \[2070 Ashad, 10\]
- What is a density based cluster? Explain an algorithm that can be used
  to generate density based clusters. \[2070 Chaitra, 8\]
- Write short notes on: DBSCAN clustering. \[2079 Chaitra, 4\]
- Write short notes on: Density reachable and Density Connected. \[2074
  Ashwin, 4\]

#strong[Issues: Evaluation, Scalability, Comparison]

- Explain different types of outlier with suitable examples. How density
  based outlier detection works? #emph[(evaluation-adjacent,
  cross-listed with Ch.6)] \[2080 Bhadra, 5+3\]
- Explain the different measures of cluster validity. \[2071 Chaitra\]
- Explain different measures that can be used to compare two clusters.
  \[2070 Ashad, 6\]
- Explain the issues regarding cluster validation. \[2069 Chaitra, 6\]
- Write short notes on: Cluster evaluation. \[2072 Kartik, 3\]
- Write short notes on: Issues in clustering. \[2074 Chaitra, 3\]
- Write short notes on: Clustering and its application in anomaly
  detection. \[2076 Ashwin, 3\]

#horizontalrule

= Chapter 6: Anomaly / Fraud Detection (3 hrs)
<chapter-6-anomaly-fraud-detection-3-hrs>
- What is anomaly detection? Explain distance-based method for anomaly
  detection. \[2082 Bhadra, 2+5\] / \[2080 Baishakh, 2+3\] / \[2073
  Shrawan, 8\] / \[2075 Ashwin, 2+6\]
- What do you mean by Anomaly Detection? Explain different approaches
  for Anomaly Detection. \[2081 Bhadra, 2+6\]
- What is Anomaly Detection? Why is Anomaly Detection important? Briefly
  explain different types of anomaly detection schemes. \[2081 Baishakh,
  2+2+4\]
- What are outliers? \[2075 Ashwin\]
- What do you mean by anomaly detection? Why is it important and where
  is it applicable? \[2079 Bhadra, 3+3\]
- Describe the strengths and weaknesses of the statistical,
  proximity-based, density-based and cluster-based approaches of anomaly
  detection. \[2079 Chaitra, 6\]
- Compare and contrast among three different methods of anomaly
  detection. \[2078 Bhadra, 6\]
- What is an Anomaly detection? Discuss its importance in security.
  \[2072 Kartik, 5\]
- What is anomaly detection? Discuss issues in anomaly/fraud detection.
  \[2072 Chaitra, part of short notes\]
- What is an Anomaly Detection? Explain few distance based approaches
  that can be used for Anomaly Detection. \[2071 Chaitra\]
- How can Nearest-Neighbor algorithm be used for anomaly detection?
  \[2071 Shawan\]
- What is anomaly detection? Explain likelihood approach for anomaly
  detection. \[2070 Ashad, 8\]
- Write short notes on: Anomaly Detection. \[2070 Chaitra, part of 15\]
- What is anomaly detection and why is it important? Describe distance
  based approaches for anomaly detection. \[2074 Chaitra, 4+3\]
- Why anomaly detection is important? Explain distance based method for
  anomaly detection. \[2075 Ashwin, 2+6\]
- What is anomaly detection? Explain the issues associated with anomaly
  detection. \[2073 Chaitra, 2+3\]
- What do you mean by anomaly detection and why is it important? \[2074
  Chaitra, part of 4+3\]
- Write short notes on: Data Mining for Anomaly Detection. \[2074
  Ashwin, 4\]

#horizontalrule

= Chapter 7: Advanced Applications (3 hrs)
<chapter-7-advanced-applications-3-hrs>
=== 7.1 Mining Object and Multimedia | 7.2 Web Mining | 7.3 Time-series
Data Mining
<mining-object-and-multimedia-7.2-web-mining-7.3-time-series-data-mining>
#strong[Object & Multimedia Mining]

- Write short notes on: Multimedia mining. \[2074 Chaitra, 3\]
- Explain Web mining and Multimedia mining. \[2075 Ashwin, 6\]

#strong[Web Mining (incl. Page Rank)]

- Explain briefly the key steps in text mining. How do you find page
  rank? Explain. \[2081 Baishakh, 4+4\]
- What is Web Mining? Briefly explain structure of Web Mining. \[2080
  Bhadra, 3+5\]
- Write short notes on: Page Rank algorithm / FP-Tree — #emph[(Page Rank
  portion)] \[2079 Bhadra, 5\]
- Write short notes on: Web mining. \[2079 Chaitra, 4\] / \[2074
  Chaitra, 3\] / \[2073 Shrawan, 4\]
- Explain web mining taxonomy. \[2076 Ashwin, 8\]
- What is web mining? Explain different categories of web mining. \[2074
  Ashwin, 6\]
- Write short notes on: www mining. \[2073 Chaitra, 4\]
- Write short notes on: Page rank algorithm in Web mining. \[2078
  Bhadra, 4\]
- Write short notes on: Page Rank. \[2069 Chaitra, 5\]

#strong[Time-series Data Mining]

- Write short notes on: Time Series Data Mining. \[2082 Bhadra, 5\] /
  \[2081 Bhadra, 4\] / \[2080 Baishakh, 5\] / \[2079 Chaitra, 4\] /
  \[2073 Chaitra, 4\] / \[2071 Shawan\]
- Explain Time series data mining in brief. \[2072 Kartik, 6\]
- Write short notes on: Time series Data mining. \[2072 Chaitra, 3\] /
  \[2074 Chaitra, 3\]
- Explain seasonality in time series data. \[2070 Ashad, 5\]