= Project Management
\ 
*_Project management_* is the process of planning, organizing, executing, and controlling a project to achieve its objectives within the given time, cost, and quality.
- Focuses on a specific project.
- Ensures the project is completed on time.
- Involves planning, monitoring, risk management, and resource allocation.

== Advantages / Importance of Project Management

Project management is important because it helps an organization plan, control, and complete projects successfully.

+ *Clear Objectives:* Defines clear goals and responsibilities for the project.
+ *Better Planning:* Properly organizes project activities, schedules, and resources.
+ *Efficient Resource Utilization:* Ensures proper use of money, materials, equipment, and manpower.
+ *Better Time Management:* Helps complete project activities on time and reduces delays.
+ *Cost Reduction:* Controls the budget and reduces unnecessary expenses and wastage.
+ *Improved Quality:* Ensures that project deliverables meet the required quality standards.
+ *Risk Management:* Identifies possible problems early and prepares suitable solutions.
+ *Better Communication and Coordination:* Improves communication and coordination among team members, customers, and stakeholders.
+ *Customer Satisfaction:* Helps meet customer requirements and improves customer relationships.
+ *Higher Productivity and Profit:* Proper management increases productivity, reduces costs, and can increase profit.

== Project Management Context as per PMI

According to PMI (Project Management Institute), project management context explains how a project is affected by its organization and surrounding environment. A project does not work alone. It is influenced by people, resources, technology, organizational culture, policies, customers, government rules, market conditions, and competition.

According to PMI, project management is divided into different phases:

+ *Initiating*
  - Defines the project and its objectives.
  - Identifies the main stakeholders.

+ *Planning*
  - Prepares the schedule, budget, resources, and activities.
  - Plans how the project will be carried out.

+ *Executing*
  - Performs the planned project activities.
  - Uses resources to produce project deliverables.

+ *Monitoring and Controlling*
  - Tracks project time, cost, quality, and progress.
  - Identifies problems and takes corrective actions.

+ *Closing*
  - Completes all project activities.
  - Delivers the final result and formally closes the project.


* Why Projects Cannot Run in Isolation*

Projects cannot run in isolation because they are always influenced by the organization and its environment. They depend on resources, people, culture, technology, and policies within the organization. They are also affected by external factors like market trends, customer needs, government rules, and competition. Projects must align with the organization’s goals and strategy to deliver value. 

Projects are connected to internal and external environments, so they cannot run independently or in isolation.

== Project Life Cycle

A Project Life Cycle is a series of phases that a project goes through from its beginning to its completion. It shows:
- What work will be done in each phase.
- What deliverables (products or services) will be produced and when.
- Who will be involved in each phase.
- How the project work will be controlled and approved.

A deliverable is a product or service produced or provided as part of a project.


== Phases of Project Life 
+ *Initiation Phase*: This is the first phase of the project life cycle, where the project is defined, and its feasibility is assessed. The project objectives, scope, and stakeholders are identified, and a project charter is created to formally authorize the project.
+ *Planning Phase*: In this phase, a detailed project plan is developed, outlining the tasks, resources, schedule, and budget required to achieve the project objectives. Risk management and quality assurance plans are also created during this phase.
+ *Execution Phase*: This phase involves the actual implementation of the project plan. The project team carries out the tasks, and progress is monitored against the project plan. Communication and collaboration among team members are crucial during this phase to ensure that the project stays on track.
+ *Termination*: This is the final phase of the project life cycle, where the project is completed, and its deliverables are handed over to the stakeholders. The project team conducts a final review to assess the project's success, document lessons learned, and formally close the project.

#figure(image("/assets/image-25.png",width:80%),
caption: "Project Life Cycle Phases"
)

== Characteristics of Project Life Cycle

+ *Complete Life Cycle:* A project passes through all phases from start to finish.
+ *Phase Review:* Each phase ends with a review of its outputs and performance.
+ *Cost and Staffing:* Cost and number of workers are generally low at the beginning, higher during the middle, and decrease rapidly near completion.
+ *Risk and Uncertainty:* Risk and uncertainty are highest at the beginning and decrease as the project progresses.
+ *Stakeholder Influence:* Stakeholders have the greatest influence at the beginning of the project, and their influence decreases as the project moves forward.

== Phases of Software Development Life Cycle (SDLC) or IT Product Development Life Cycle

The Software Development Life Cycle (SDLC) is a systematic process of creating and delivering an IT product, such as software or an application, from beginning to end.

=== Stages of SDLC

+ *Requirement Analysis*
  - Gather and understand user needs and requirements.
  - Identify functional and non-functional requirements.
  - Prepare the SRS (Software Requirement Specification) document.

+ *System Design*
  - Plan the architecture and structure of the software.
  - Design the database, interfaces, modules, and data flow.
  - Helps developers understand how to build the software.

+ *Implementation / Coding*
  - Developers write the actual program code according to the design.
  - Use suitable programming languages and coding standards.
  - Divide the system into modules for easier development and management.

+ *Testing*
  - Checks whether the software works correctly and meets requirements.
  - Finds and fixes bugs and errors.
  - *Common types of testing:*
    - *Unit Testing* : Tests individual modules.
    - *Integration Testing* : Tests combined modules.
    - *System Testing* : Tests the complete system.
    - *Acceptance Testing* : Checks whether the system is acceptable to the user.

+ *Deployment / Installation*
  - The completed software is installed and released for users.
  - It may be released in stages, such as beta release or full release.
  - Users start using the software in the real environment.

+ *Maintenance / Support*
  - Fixes bugs found after deployment.
  - Updates the software according to new requirements.
  - Improves the system and ensures it works efficiently over time.

== Waterfall Model

The Waterfall model is a traditional, step-by-step way to build software. It follows a straight line where each phase must be completely finished before the next one can start, and it is very hard to go back and make changes once a phase is done.

#figure(
  image("/assets/image-26.png",width:80%),
  caption: "Waterfall Model",
)

== Agile Model

Agile is a flexible, fast-paced way to work where a project is built in small, repeatable pieces called sprints. Instead of waiting until the very end to show the client, the team delivers small, working parts continuously and welcomes changes at any time based on feedback.
#figure(
  image("/assets/image-27.png",width:50%),
  caption: "Agile Model",
)
== Royce Model

The Royce model (often considered the original or strict version of the Waterfall model introduced by Winston W. Royce) emphasizes a disciplined, documented flow from one phase to the next. While it originally highlighted the risks of doing things in a strictly linear way without feedback, it is generally known for its structured, document-heavy progression through development stages.
#figure(
  image("/assets/image-28.png",width:60%),
  caption: "Royce Model",
)
== RAD (Rapid Application Development)

RAD is a fast development method that focuses heavily on building quick test versions and prototypes rather than spending a long time on heavy planning. It relies on constant user feedback and reusable components to deliver a working system or product much faster.

#figure(
  image("/assets/image-29.png",width:60%),
  caption: "RAD Model",
)

== Waterfall vs. Agile vs. RAD (Rapid Application Development)

#table(
  columns: (auto, 1fr, 1fr, 1fr),
  inset: 10pt,
  align: left,
  table.header(
    [*Feature*], [*Waterfall*], [*Agile*], [*RAD*]
  ),
  [*Approach*], 
  [Linear and sequential; each phase must finish before the next begins.], 
  [Iterative and incremental; built in short cycles called sprints.], 
  [Prototyping-focused; emphasizes fast prototyping and reusable components.],

  [*Flexibility*], 
  [Very low; changes are difficult and expensive once set.], 
  [Very high; changes can be easily made at any stage.], 
  [High; accommodates changes through early user feedback and prototypes.],

  [*Client Involvement*], 
  [Mostly at the beginning (requirements) and the end (delivery).], 
  [Continuous throughout the entire development process.], 
  [High and continuous, especially during early prototyping.],

  [*Delivery Style*], 
  [The complete product is delivered all at once at the very end.], 
  [Small, usable features are delivered continuously.], 
  [Working models and prototypes are delivered rapidly.],

  [*Best Suited For*], 
  [Projects with stable, clear, and unchanging requirements.], 
  [Complex projects with evolving requirements.], 
  [Projects that need speed, MVPs (Minimum Viable Products), and fast user testing.]
)


== Product Life Cycle (PLC)

The Product Life Cycle (PLC) describes the stages a product goes through from its introduction to the market until its withdrawal or replacement.

=== Stages of Product Life Cycle

+ *Introduction*
  - The product is launched in the market.
  - Sales grow slowly.
  - Initial production and marketing costs are usually high.

+ *Growth*
  - Sales increase rapidly.
  - Profit increases.
  - The product gains market acceptance.
  - More customers start using the product.

+ *Maturity*
  - Sales reach their highest level and become stable.
  - Competition becomes high.
  - Profit may start to decrease due to competition.

+ *Decline*
  - Sales and profits decrease.
  - Demand for the product becomes low.
  - The product may be discontinued or replaced.

=== Importance of Product Life Cycle

The product life cycle helps companies plan their marketing, production, pricing, and investment strategies at different stages of a product.

=== Similarities between Product Life Cycle and Project Life Cycle

+ Both have different stages from beginning to end.
+ Both require planning, execution, and monitoring.
+ Both aim to produce a final product or result.
+ Both require resource allocation and risk management.

=== Product Life Cycle vs. Project Life Cycle

#table(
  columns: ( auto, auto),
  inset: 10pt,
  align: left,
  table.header(
     [*Product Life Cycle*], [*Project Life Cycle*]
  ),
   [Usually longer than a project life cycle.], [Usually shorter than a product life cycle.],
   [It is a superset of the project life cycle.], [It can be a subset of the product life cycle.],
   [May or may not have a definite end.], [Has a definite beginning and end.],
   [Phases: Development, Introduction, Growth, Maturity, Decline], [Phases: Initiation, Planning, Execution, Monitoring & Controlling, Closing],
   [Phases are generally sequential and do not overlap.], [Phases may overlap.],
   [One product life cycle can contain more than one project.], [A project has one specific life cycle and ends after achieving its objective.]
)

== Project Integration Management

Project Integration Management is the process of coordinating and combining all parts of a project to ensure that the project is completed successfully.

It ensures that:
- All project activities, resources, and processes work together.
- Different parts of the project are properly coordinated.
- Competing demands such as scope, time, cost, and quality are balanced.

== Essential Information Required to Create a Project Charter

A Project Charter is a document that officially authorizes a project and provides basic information about it.

+ *Project Purpose / Objective:* Explains why the project is being done.
+ *Project Scope:* Defines what is included and excluded from the project.
+ *High-Level Requirements:* Lists the major features or functions required.
+ *Key Stakeholders:* Identifies people or groups involved in or affected by the project.
+ *Project Manager and Authority:* Identifies who will manage the project and their responsibilities and authority.
+ *Assumptions and Constraints:* Identifies conditions that may affect the project, such as time, budget, and resources.
+ *Preliminary Schedule and Budget:* Provides rough estimates of the project duration and cost.
+ *Approval Requirements:* Identifies who has the authority to approve the project.

== Roles and Responsibilities of Key Project Members

+ *Project Sponsor*
  - Provides funding and resources.
  - Approves major decisions.
  - Provides top-level support for the project.

+ *Project Manager*
  - Plans, executes, and monitors the project.
  - Manages the team, schedule, budget, and risks.
  - Ensures project objectives are achieved.

+ *Project Team Members*
  - Perform tasks assigned by the project manager.
  - Provide their skills and expertise.
  - Help achieve project objectives.

+ *Stakeholders*
  - Include clients, users, customers, and other affected parties.
  - Provide requirements, feedback, and support.
  - Can influence the project.

+ *Project Management Office (PMO)*
  - Provides standards, templates, tools, and guidance.
  - Monitors project performance.
  - Ensures projects are aligned with organizational goals.

+ *Functional Managers*
  - Manage resources within their department or functional area.
  - Assign staff, equipment, and other resources to support the project.

== Role of System Development Life Cycle (SDLC) in ICT Project Management

SDLC (System Development Life Cycle) is a structured process used to develop and manage ICT systems effectively. It guides an ICT project from the initial idea to development, deployment, and maintenance.

=== Stages of SDLC in ICT Projects
+ *Planning*
  - Defines the system objectives and scope.
  - Checks the feasibility of the project.
  - Determines what resources are required.

+ *Analysis*
  - Collects and analyzes requirements from users and stakeholders.
  - Identifies what the system should do.

+ *Design*
  - Prepares the system architecture.
  - Designs the database, user interface, and system structure.

+ *Development (Coding)*
  - Developers build the actual system.
  - Code is written according to the design specifications.

+ *Testing*
  - Checks the system for errors and defects.
  - Tests performance, functionality, and quality.
  - Ensures the system works as expected.

+ *Deployment*
  - The completed system is released and made available to users.
  - The system is installed and configured in the actual environment.

+ *Maintenance*
  - Fixes problems found after deployment.
  - Updates and improves the system.
  - Keeps the system working properly over time.

=== Importance of SDLC
- Ensures the system meets user requirements.
- Reduces risks, errors, and development problems.
- Provides a systematic and structured approach to development.
- Helps in planning, monitoring, and controlling ICT projects.
- Helps complete the project within the required time, cost, and quality.