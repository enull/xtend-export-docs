# Xtend Export Feature Analysis

## Attention to Operational Aspects
Considering the nature of the challenge as expressed in the instructions as *"Please take this as an opportunity to demonstrate the best of your abilities."*, I decided to highlight my intrinsic attention to the full breadth of operational aspects that goes into any system of consequence. 


To efficiently adapt to the reality of tactical situations, I attempt to quickly but comprehensively consider what is known and what is assumed of the technical workflow, project value and, of course, the business features. The latter is fairly apparent, but the first two deserve a bit of explanation.


By technical workflow, I mean the technical practices of the dev-test-debug toolchains as well as basic architectural approach and peculiarities of the stack. In short, anything that's more directly an engineering concern.

And by project value, I mean the concerns that connect the engineering effort to other teams and the system's life outside of the development process (technical documentation, test affordances) that assist us in working efficiently with the system and help us reason about the system beyond the business features.

To that end, I rely heavily on source control history (through git commit log) and developer notes (through markdown) for most of what I do.

## Data Requirements Analysis
I generally start making sense of a system's needs by looking at the types, relations and constraints implied by the described features of the requested system and imagining a relational model that will meet the stated needs. For me (especially given that a logical schema for the key entities was provided), this is easiest to analyze with sql against a test database. This helps verify latent assumptions by requiring specific details, where gaps and guesses are indicators of areas that need more exploration or conversation; this also serves the further purpose of initializing a trivial test data store for any prototype work to operate against.

For the actual project, I expect that EF code-first migrations would be the better option, but sql's expression of types, constraints and relations are more natural to me, making finding incongruities and other data problems hidden in the requirements more easy to discover.

## Project/Repository Setup
After pulling together more than a few artifacts, I set up a repository to track the evolution of the project (in this case, starting with this "meta" documentation repo). While other supporting systems are optional, source control for my work is critical and fundamental.


### Server-Dal Starting point
Next, to skip much of the technical scenery, I decided to start with the existing aspnet core MVC-EF implementation from the aspnet docs samples
* [Contoso University MVC Core/EF Core sample](https://github.com/aspnet/Docs/tree/master/aspnetcore/data/ef-mvc/intro/samples/cu-final)

