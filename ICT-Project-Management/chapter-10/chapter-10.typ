= Project Quality Management

Project quality management includes the processes required to ensure that the project satisfies the needs for which it is undertaken.

=== Project Quality

Project quality is the totality of features and characteristics of a product or service that bear upon its ability to satisfy stated or implied needs. It means delivering a product or service that is fit for use, free from defects, and satisfies requirements.

*Quality Formula:*
$ Q = frac(P, E) $
where:
- *P:* Performance or result
- *E:* Expectation or requirement


=== 3'C of Quality
+ Commitment: Ensure that all team members are committed to quality standards and practices.
+ Communication: Maintain open and effective communication channels to address quality issues promptly.
+ Competence: Ensure that team members have the necessary skills and knowledge to meet quality requirements.
=== Improving IT Project Quality

A project manager can improve IT project quality by:

+ *Clear Requirements:* Gather and document detailed requirements to avoid misunderstandings.
+ *Quality Planning:* Define quality standards and success criteria before starting the project.
+ *Regular Reviews and Testing:* Conduct code reviews, system testing, and user acceptance testing to find errors early.
+ *Use of Tools:* Use automated testing, version control, and project management software to maintain consistency.
+ *Skilled Team:* Train the team in the latest technologies and best practices.
+ *Stakeholder Involvement:* Involve users and clients in reviews and feedback sessions.
+ *Continuous Improvement:* Use lessons learned and project evaluations to improve future projects.


== Lean Production Theory

Lean production is a management approach that focuses on reducing waste while maintaining quality.

- *Waste:* Anything that does not add value and increases cost.
- *Application:* Lean production can be applied to all parts of a business, from design and production to distribution.

== Kaizen Theory (Continuous Improvement)

Kaizen is a Japanese word that means "continuous improvement." It focuses on making small, regular improvements across all parts of an organization, sharing a strong foundation with Agile and Lean methods by aiming to reduce waste and optimize processes step-by-step.

=== Principles of Kaizen
+ *Know Your Customer:* Always focus on fulfilling customer needs.
+ *Let It Flow:* Keep workflows smooth and eliminate unnecessary waste.
+ *Follow Leadership:* Ensure leaders remain aware of daily operations at every level.
+ *Motivate People:* Encourage employees to actively share ideas for improvement.
+ *Be Transparent:* Share progress and performance using clear, real-world data.

== Just-in-Time (JIT) Production

JIT is an inventory and production strategy where materials are received and parts are produced *only* when they are needed, helping minimize waste and storage costs.

=== Types of Waste Reduced by JIT
- Overproduction waste
- Waiting time
- Transportation waste
- Unnecessary processing
- Excess inventory
- Unnecessary movement
- Defective products

=== Steps in JIT
+ *Build Trust with Suppliers:* Establish dependable supplier relationships so materials arrive precisely when required.
+ *Strong Communication:* Maintain clear communication channels internally and with external partners.
+ *Work in Small Lots:* Produce in smaller quantities to catch defects early and maintain tight control.
+ *Efficient Workflow:* Keep processes smooth to eliminate operational bottlenecks and delays.
+ *Backward Scheduling:* Start from the final delivery deadline and plan backward to schedule preceding tasks.

== Quality vs. Productivity

#table(
  columns: (auto, 1fr, 1fr),
  inset: 10pt,
  align: left,
  table.header(
    [*Aspect*], [*Quality*], [*Productivity*]
  ),
  [*Definition*], [Measures how well a product or service meets required standards and customer expectations.], [Measures how much output is produced using a given amount of time and resources.],
  [*Focus*], [Focuses on doing the work *correctly*.], [Focuses on doing the work *quickly and efficiently*.],
  [*Goal*], [Achieving customer satisfaction and producing defect-free outputs.], [Producing maximum output using minimum resources.],
  [*Measurement*], [Measured by defects, errors, customer complaints, and standard compliance.], [Measured by output per hour, unit cost, and time efficiency.],
  [*Example*], [A software program running completely bug-free.], [A factory producing 500 units in a single day.],
  [*Trade-off*], [High quality often requires more time and resources.], [Pushing excessive speed for productivity can compromise quality.]
)

== Project Quality Management (PMBOK Processes)

Project Quality Management ensures that the project meets the needs and requirements for which it was undertaken.

=== The 3 Processes of Project Quality Management

+ *Quality Planning*
  - Defines quality standards and how to achieve them.
  - Decides the methods, tools, and measurements used to check quality.
  - *Example:* Specifying coding standards and review checklists for a software project.

+ *Quality Assurance (QA)*
  - Ensures that the project follows the required quality processes.
  - Includes audits, process checks, and peer reviews.
  - *Example:* Regularly auditing development processes and code review procedures.
  - *QA Team Responsibilities:*
    - Set Processes -- Make rules, standards, and procedures to maintain quality.
    - Get Trained -- Develop the skills needed for quality management and process compliance.
    - Check Tests -- Ensure that testing procedures meet project requirements and standards.

+ *Quality Control (QC)*
  - Checks actual project results to see whether they meet quality standards.
  - Finds defects and takes action to correct them.
  - *Example:* Running automated and manual testing on software features before release.
  - *Main Outputs of QC:*
    - Acceptance Decisions -- Decide whether deliverables meet quality acceptance criteria.
    - Rework -- Fix identified defects and problems.
    - Process Adjustments -- Modify processes to prevent future errors.

== Attributes of Quality Requirements

+ *Completeness:* All necessary requirements are included and nothing critical is missing.
+ *Correctness:* Requirements are accurate and precisely describe what the system should do.
+ *Usefulness:* Requirements are practical and genuinely useful for users and the project.

== Project Quality Requirements in IT Projects

+ *Functionality:* How well the system performs its required functions and tasks.
+ *Features:* Special functions, capabilities, or options provided to users.
+ *System Outputs:* The appearance, clarity, and format of screens, reports, and data displays.
+ *Performance:* How fast, responsive, and efficiently the system works under load.
+ *Reliability:* How consistently the system works correctly without failing under normal conditions.
+ *Maintainability:* How easily the system can be fixed, updated, or improved over time.

== Seven Basic Tools of Quality Control

The Seven Basic Tools of Quality Control are simple, widely used graphical tools employed to identify, analyze, and solve quality-related problems in a process.

+ *Flowchart:* A diagram that shows the sequential steps of a process, including decisions, inputs, outputs, and loops.
+ *Run Chart:* A line graph that plots data points over time to identify trends, cycles, or patterns.
+ *Scatter Diagram:* A graph that plots pairs of numerical data to show the relationship between two variables, helping identify possible cause-and-effect correlations.
+ *Histogram:* A bar graph that illustrates the frequency distribution of continuous data.
+ *Pareto Diagram:* A combination of a bar graph and a cumulative line graph based on the 80/20 rule.
  - *Bars:* Show individual defect frequencies or values in descending order.
  - *Line:* Shows the cumulative total percentage.
  - *Use:* Helps find the most vital problems and decide where to focus improvement efforts first.
+ *Control Chart:* A statistical graph that tracks process performance over time against upper and lower control limits to check whether a process is stable.
  - *Purpose:* Prevent defects rather than just inspecting them out.
  - *In Control:* Variations are caused by normal, random factors (no immediate process adjustment needed).
  - *Out of Control:* Variations are caused by assignable, unusual factors (causes must be identified and corrected).
  #figure(image("/assets/image-36.png",width: 80%),caption:"Control Chart Example")
+ *Cause-and-Effect Diagram (Fishbone / Ishikawa Diagram):* A structured diagram used to trace the root causes of a quality problem by categorizing potential sources.
  - *Shape:* Resembles a fish skeleton.
  - *Right Side:* The effect or problem statement.
  - *Left Side:* Major categories of causes branching out.
  - *Steps to Create:*
    + Write the Problem Statement.
    + Identify Major Cause Categories.
    + Brainstorm Possible Causes.
    + Categorize Causes into respective branches.
    + Identify Deeper Causes (asking "why?").
    + Select Root Causes that require corrective action.
    #figure(image("/assets/image-37.png",width:85%),caption:"Cause-and-Effect Diagram Example")


== Implementing Quality Assurance and Quality Control

Quality is one of the most important factors in project management because it ensures that project outputs meet customer expectations and organizational standards. Both Quality Assurance (QA) and Quality Control (QC) are used to achieve project success.

=== Quality Assurance (QA)
Quality Assurance is a proactive process done *before* work is delivered.
- *Focus:* Preventing defects by improving processes and methods.
- *Activities:* Preparing a Quality Management Plan, defining quality standards, conducting training, process documentation, audits, and benchmarking.
- *Outcome:* Reduces errors early and ensures consistent, reliable results.

=== Quality Control (QC)
Quality Control is a reactive process done *after* work is produced.
- *Focus:* Checking and testing project deliverables to ensure they meet defined quality standards.
- *Activities:* Inspections, measurements, and reviews using tools like control charts, Pareto diagrams, and fishbone diagrams.
- *Outcome:* If defects are found, corrective actions such as rework or process adjustments are taken.

=== QA and QC Together
- QA ensures that the *correct process* is followed to prevent errors.
- QC checks the *final output* to find and correct remaining errors.
- Together, QA and QC help achieve customer satisfaction, reduce failure costs, and deliver quality products.

=== Quality Audit
A quality audit is a systematic review of project processes to check whether they follow organizational and project quality standards. Its goal is to find areas for improvement, prevent mistakes, and ensure best practices are followed.

*Processes of Quality Audit:*
+ *Planning:* Prepare the audit plan.
+ *Preparation:* Study the company's quality management system and project documents.
+ *Execution:* Collect information and check whether standards are followed.
+ *Conclusion and Follow-up:* Prepare the audit report, suggest improvements, and correct problems.

== Project Quality Requirements & Balanced Scorecard 

=== Project Quality Requirements
Project quality requirements are the standards, conditions, and criteria that a project’s deliverables must meet to satisfy customers or stakeholders. They ensure that the product, service, or result is useful and meets agreed requirements (*Example:* A software should load within 2 seconds, support 10,000 users, and have no critical bugs).

*How Quality Requirements Help:*
+ *Clear Benchmark:* Define what "quality" means for the project.
+ *Guide Planning:* Assist in preparing the Quality Management Plan.
+ *Monitoring & Control:* Help check whether the project meets quality standards.
+ *Reduce Rework:* Help find and fix problems early.
+ *Build Confidence:* Increase customer and stakeholder trust.

=== Balanced Scorecard (BSC)
A Balanced Scorecard (BSC) is a tool used to measure project performance from multiple perspectives, combining financial and non-financial metrics to give a complete picture of project success.

*Role in Project Quality Management:*
- Helps convert quality requirements into measurable goals.
- Checks quality using cost, time, customer satisfaction, and efficiency.
- Encourages continuous improvement by monitoring performance.

*4 Key Perspectives of Balanced Scorecard:*
+ *Financial:* Are we within budget and getting financial benefits?
+ *Customer:* Are customers and stakeholders satisfied with the quality?
+ *Internal Processes:* Are project processes efficient and free from defects?
+ *Learning & Growth:* Is the project team improving its skills, knowledge, and innovation?

== Total Quality Management (TQM) 

Total Quality Management (TQM) is a continuous process in which everyone in an organization works together to improve the quality of all activities, focusing on customer satisfaction, continuous improvement (Kaizen), and total employee involvement.

=== Quality Standards for Software Industry & Services
+ *ISO 9001:* General quality management standard used across industries.
+ *ISO/IEC 25010:* Standard for software product quality (reliability, usability, performance).
+ *ISO/IEC 27001:* Standard for information security management.
+ *CMMI:* Framework to improve software development processes.
+ *ITIL:* Best practices for IT service management.

=== Relation with Other Standards
- *Manufacturing:* Uses ISO 9001, Six Sigma, and Lean.
- *Healthcare:* Uses ISO 13485 and JCI standards.
- *Construction:* Uses ISO 45001 (safety) and ISO 14001 (environmental management).
- *Software / Services:* Uses ISO/IEC 25010, CMMI, ITIL, and ISO 9001.

=== Basic Approach of TQM
+ *Customer Focus:* Meet or exceed customer expectations since customers define quality.
+ *Continuous Improvement (Kaizen):* Make small, regular improvements at every organizational level.
+ *Process-Centered Approach:* Focus on improving processes to reduce defects rather than just fixing symptoms.
+ *Total Employee Involvement:* Every employee takes responsibility for maintaining quality.
+ *Integrated System:* All departments work together toward common quality goals.
+ *Fact-Based Decision Making:* Use data and measurements instead of guesswork.
+ *Communication & Leadership:* Leaders provide clear direction and motivate employees to practice TQM.

== Detailed Comparison: Bar Chart vs. Control Chart vs. Pareto Chart

#table(
  columns: (auto, auto, auto, auto),
  inset: 10pt,
  align: left,
  table.header(
    [*Aspect*], [*Bar Chart*], [*Control Chart*], [*Pareto Chart*]
  ),
  [*Purpose*], 
  [To compare different categories, items, or groups of data side-by-side.], 
  [To monitor whether a process stays stable, consistent, and predictable over time.], 
  [To identify and prioritize the most important problems or defects following the 80/20 rule.],

  [*Data Type*], 
  [Categorical or discrete numerical data grouped by category.], 
  [Numerical quantitative data collected sequentially over time.], 
  [Categorical frequency data organized from highest to lowest occurrence.],

  [*Key Feature*], 
  [A set of separate rectangular bars where height represents value or count.], 
  [A line graph featuring a center line, an Upper Control Limit (UCL), and a Lower Control Limit (LCL).], 
  [A combination of a descending bar graph and a cumulative percentage line graph.],

  [*Use in Quality Management*], 
  [Used generally to visualize category counts, resource allocation, or basic defect comparisons.], 
  [Used during *Quality Control* to track performance trends and catch unusual process shifts early.], 
  [Used to separate the "vital few" problems from the "trivial many" to focus improvement efforts.],

  [*Example in Project Management*], 
  [Comparing the total budget or total bug counts across different project phases (Planning, Coding, Testing).], 
  [Tracking daily website loading times or bug counts to ensure they stay within control limits.], 
  [Showing that 80% of system crashes are caused by just 20% of the software bugs.]
)

==  Control Chart vs. Cause-and-Effect Diagram

#table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: left,
  table.header(
    [*Aspect*], [*Control Chart*], [*Cause-and-Effect Diagram (Fishbone)*]
  ),
  [*Purpose*], 
  [To monitor whether a process stays stable, consistent, and predictable over time.], 
  [To brainstorm, organize, and find the underlying *root cause* of a specific problem.],

  [*Data Type*], 
  [Numerical, quantitative data collected sequentially over time (e.g., numbers, measurements, times).], 
  [Qualitative, descriptive ideas, opinions, and categories gathered through team brainstorming.],

  [*Key Feature*], 
  [A line graph featuring a center line, an Upper Control Limit (UCL), and a Lower Control Limit (LCL).], 
  [A skeleton-like structure that groups potential causes into main categories (like people, methods, and materials).],

  [*Use in Quality Management*], 
  [Used during *Quality Control* to track performance and catch unusual process shifts before defects happen.], 
  [Used for *root-cause analysis* during troubleshooting when a defect or failure has already occurred.],

  [*Example*], 
  [Tracking daily website loading times to ensure they stay within acceptable upper and lower limits.], 
  [Investigating why a software build keeps failing by categorizing possible causes into coding bugs, server issues, and network errors.]
)

\

* How Pareto Charts Help in Achieving Better Quality in Projects *

\

+ *Identify Major Problems:* Pareto charts follow the 80/20 rule (about 80% of problems come from 20% of causes), helping project managers quickly zero in on critical issues.
+ *Prioritize Efforts:* They highlight which defects occur most frequently, enabling teams to tackle high-impact problems first.
+ *Improve Decision-Making:* They provide a clear visual representation to help allocate time, money, and resources effectively.
+ *Reduce Rework and Costs:* Fixing the root causes of major defects early prevents repeated work and lowers extra expenses.
+ *Increase Customer Satisfaction:* Addressing primary quality issues results in a more reliable product that meets customer expectations.
+ *Support Continuous Improvement:* They can be used periodically to monitor whether major defect rates are successfully decreasing.

== Project Management Maturity

Project Management Maturity is the measure of how well an organization’s project management processes are developed, standardized, and continuously improved to complete projects effectively.

=== Ways to Improve the Quality of IT Projects
+ *Define Quality:* Define quality based on what users truly need.
+ *Use Clear Quality Measures:* Establish and share simple, transparent quality standards.
+ *Set Quality Goals:* Integrate strict quality requirements directly into project goals.
+ *Correct Requirements:* Ensure requirements are accurate and well-understood from the very beginning.
+ *Smart Testing:* Plan testing strategies properly to uncover vital errors efficiently.
+ *Prevent Bugs:* Design software carefully to minimize architectural errors from the start.
+ *Use Testing Tools:* Utilize automated testing and other supportive tools effectively.
+ *Use Maturity Models:* Apply frameworks like PMMM and CMMI to systematically upgrade project processes.

== Project Management Maturity Model (PMMM)
PMMM is a tool used to measure how mature an organization is in managing projects, providing a clear roadmap for organizational process improvement.

=== Five Levels of PMMM
+ *Level 1: Initial* : Processes are ad-hoc, unplanned, or chaotic; projects frequently exceed time and budget constraints.
+ *Level 2: Managed* : Basic project management processes are planned, executed, measured, and controlled at the project level.
+ *Level 3: Defined* : Standard processes, methods, and templates are fully documented, standardized, and integrated across the organization.
+ *Level 4: Quantitatively Managed* : Detailed metrics are collected, and processes are controlled using statistical and quantitative data.
+ *Level 5: Optimizing* : Focus shifts to continuous process improvement using performance feedback, innovative ideas, and advanced metrics.
#figure(image("/assets/image-38.png"),caption:"Project Management Maturity Model (PMMM) Levels")