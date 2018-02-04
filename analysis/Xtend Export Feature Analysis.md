# Xtend Export Feature Analysis

## Data Requirements Analysis
I generally start making sense of a system's needs by looking at the types, relations and constraints implied by the described features of the requested system and imagining a relational model that will meet the stated needs. For me (especially given that a logical schema for the key entities was provided), this is easiest to analyze with sql against a test database. This helps verify latent assumptions by requiring specific details, where gaps and guesses are indicators of areas that need more exploration or conversation; this also serves the further purpose of initializing a trivial test data store for any prototype work to operate against.

For the actual project, I expect that EF code-first migrations would be the better option, but sql's expression of types, constraints and relations are more natural to me, making finding incongruities and other data problems hidden in the requirements more easy to discover.

