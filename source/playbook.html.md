# Ministry of Velocity Playbook

This is a guide to Ministry of Velocity's consulting practice. This details the way we work together as a team and partners with our customers. We sometimes call the company MoV or Minifast, and our customers have often called us Ministers.

This is an inward-looking document that speaks to our past experience.  This is also an outward-looking document that shares how we believe our customers are most successful.

This playbook owes an historic debt to [thoughtbot's playbook](https://playbook.thoughtbot.com). That playbook was licensed under a Creative Commons Attribution-NonCommercial license.


## Guiding Principles

* Few policies, actively pruned
* Minimal hierarchy, few job titles
* Avoid speaking privately about each other, and about clients
* Empathy and understanding beats ego and high-handedness
* High standards for each other and for hiring
* We take the initiative to improve ourselves and better our community


## Time

* We follow XP guidelines about sustainable pace
* Four-day weeks, with Fridays allocated to Community Time
* Time off of project work is discussed internally to ascertain impact, then externally with the customer
* After-hours communication is safely ignorable; urgent needs are forwardable


### Consulting Time

* MoV makes money through consulting
* Consulting starts with sales, progresses through an inception, ends with an outception
* We want to be so good that clients beg us to work for them
* We want to be so great that our teammates won't want to leave


### Community Time

* Fridays are set aside for community benefit work
* Open source, volunteering, mentoring
* Work on conference talks
* Sales
* Bring someone new into the MoV sphere
* Make a relationship inside the MoV sphere stronger
* Work on the website


### Beach Time

* Defined as downtime between client projects
* Ramp up on new technologies
* Emphasis on generating more presence for MoV


## Conduct

* MoV places enormous value on openness, inclusion, and empathy as a default
* We look to Coraline Ada Ehmke's code of conduct example
* Our offices and interactions are governed by a code of conduct


## Platform Selection

* Selection of technologies depends mostly on end-user needs
* Also to be considered are our needs: strong community, developer happiness, speed of development

### Web Apps

* Rails because: it's fast, it's familiar, it's everywhere


### Mobile Apps

* Mobile web by default
* We will go native only if camera, gyroscope, or on-device information access is necessary


### Default technologies

* Ruby on Rails
* ES2015 and React.js
* Swift and Core Data
* Postgres
* Redis


### Licenses

* Permissive licensing by default
* Avoid copyleft because of the viral aspect
* MIT, BSD, ISC, Apache 2.0


### Machine Setup

* OSX configured by Sprout


## Planning

* On-site representative from the customer side makes priority decisions
* Deployable software in small chunks
* Multiple daily deployments
* Prefer high-fidelity communication


### Standup

* MoV internal standup is 9:15AM
* Interestings, Helps, New Faces at MoV
* Project standup is 9:30AM
* Backlog review, blocking items, pair rotation
* Helps to build cohesion by: seeing each other's faces, learning what other teams are doing, building accountability and trust


### User Stories

* We model the work we do as User Stories in Pivotal Tracker
* Stories consist of a description of the audience, conditions, action to be taken, and acceptance criteria
* Stories start out in the icebox, both unestimated and unprioritized
* Stories are prioritized relative to one another in the backlog
* Once each Story is prioitized in the backlog, the team estimates its complexity relative to other Stories
* The top Story in the backlog is worked on by the approriate members of the team
* Stories usually don't take longer than a day to complete
* Stories that take longer than a day can live on a temporary feature branch
* When the team is finished implementing the story, the work is pushed to the master branch of the git repository
* There is no bottleneck for pushing code to the master branch: everyone can do it
* Code on the master branch is automatically deployed to a staging environment, and the Story is marked as Delivered
* There is no bottleneck for deploying to staging: everyone can do it.
* Each Delivered Story is examined by the person who wrote the Story and potentially a designer; if a Story's acceptance criteria is met, the Story is marked is Accepted
* If all code in the staging environment corresponds to Accepted cards, the code may be released to production
* There is no bottleneck for releasing to production: everyone can do it.
* If a Story's acceptance criteria is not met, the Story is Rejected,  the reasons for rejection are recorded, and the card moves to the top of the Backlog where it can be reprioritized or restarted
* The rate at which the estimated complexity of cards is completed over the period of a week is called Velocity, and Velocity stabilizes over the course of an engagement


### Iteration Planning

* Early each week, instead of a Project Standup, everyone gets together with the goal of everyone starting the week feeling excited and empowered for the upcoming week of work
* To initiate the meeting, the team provides a temperature check in a counterclockwise order, starting from the person newest to the project
* After that, the customer and team members share customer stories. Is user testing working out?  How are people using the product?  How does the conversion funnel look?  Does Twitter love it?  Are people coming back?  Are we building the right product?
* Then, the customer reviews the backlog, adding stories from the icebox that are a priority for the week, iceboxing stories that are no longer a priority or will not happen in the next week
* Next, the whole team reviews existing Stories in the backlog, both estimating for Stories without estimates and suggesting improvements or simplifications for Stories
* Last, the customer prioritizes stories relative to one another, and the team has a clear plan for what to do next.


### Retrospective

* Late in each week, during the last hour of the day, everyone gets together with the goal of feeling accomplished and grateful for the previous week of work
* To initiate the retro, a member of the team is picked as the facilitator; they draw three columns whiteboard, each topped with a face: happy, so-so, and sad
* Then, team members spend 10 minutes writing their impressions from the previous week on the board under each column
* Next, the facilitator groups impressions by topic, and the team discusses each topic, taking time to celebrate successes as much as discuss concerns
* After that, the facilitator writes action items to address concerns.


### On-site Customer

* XP requires that the customer is always available, ideally face-to-face
* The ideal engagement is one where the customer works from our office from Monday til Thursday for the duration of the project
* Still acceptable is one where the customer is available on Slack
* We will decline projects where the customer is unavailable


## Team Roles

* At the beginning of the project, we define a single point of contact on the customer side
* We also establish the role of the anchor, the developer who will not rotate onto other engagements
* All other developers on the project are assumed to be allocated for the duration, but may occasionally rotate onto other engagements with notice


### Remoting

* We sometimes use internet-based tools like Screenhero and Sococo to coordinate with customers and other team members
* One common reason for remote work is that team members aren't in the same city for the duration of the project
* Another reason is that the client is offsite for some period of time
* If part of the team is remote, the whole team uses remote coordination tools


### Starting In-Person

* At the beginning of the engagement, all team members work together for at least a week
* This is useful in order to allow the team to develop relationships, which makes asynchronous communication easier down the road
* Except in rare circumstances, the team meets in person at intervals during the project

