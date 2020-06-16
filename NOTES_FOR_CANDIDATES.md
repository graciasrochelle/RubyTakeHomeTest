# Notes For Candidates

Take home coding tests can be tricky and candidates can struggle to show off their best work at this stage of the interview process. Before starting on the test, please read through this document carefully as it explains our expectations and some of the ‘gotchas’ that we come across frequently.

Whilst we always evaluate coding tests with the attitude of wanting applicants to succeed, we see a lot of submissions and so the best way to get a nod of approval is to make things clear and easy for the people reviewing your code to understand - ie make it easy for us to hire you!

At GreenSync, the most common languages in use are Ruby, Javascript, Java and Go. If you’re not proficient with one of those languages, that’s OK, you can use another language for the coding test - within reason (we don’t have a great need for anyone fluent in Whitespace, or LOLCODE, so if it’s not a ‘popular’ language, check with us before starting). If you do use a different language, remember that the person reviewing it may not know the language well, so add some extra notes and instructions.

The time taken to complete the coding test will vary based on the language used (Ruby's built in CSV handling will make it a bit quicker than other languages where CSV parsing may need to be done manually). Regardless of the language used, we don't want you to spend more than four hours working on your solution.

We have different coding tests for different developer levels (Apprentice through to Architect). If you think you’ve been given the wrong level test, please contact us - it was probably a misunderstanding of the position you’re applying for.

## Follow The Instructions

This should be obvious, but we do get submissions that solve the wrong problem. We want developers who can code a solution to the problem put in front of them, not what they think the problem is, or what they think the problem might become.  

If the requirements are unclear or you’re unsure of something, please contact us - we encourage asking questions at GreenSync and see no reason why that shouldn’t start now!

The next step in our interview process is a pairing session with one of our developers. In this session, we’ll take the code that you submit and extend it; adding new features. So try to get through as many of the requirements as possible, however we'd prefer you to send us what you completed with some notes about what you'd do next rather than spend too much time on it.

## Design Your Code

The test we’re giving you is meant to be relatively straightforward and could be solved using a simple script; but that’s not what we’re looking for. We want you to come up with a design that not only solves the problem, but will allow for future extension. 

For example, if we’re asking for you to read in data from a file, how much effort would it take to enable your program to read the data from a different format file? Is it a case of rewriting a big chunk of code, or do you just need to create and use a different file parser? (A not so subtle hint!)

## Include A README.md File

We see a lot of coding tests and whilst it might be obvious to you how to run your code, it may not be to us (especially if it’s in a language we’re not familiar with). Please include some simple instructions on how to compile (if needed), run and test your code.

Some notes about the design, any assumptions made and why you made certain decisions would also be helpful, but not required. Having said that, we’re not after a ten page document and probably wouldn’t read it if you wrote one.

## Dependencies

Our coding tests can be completed with default features / libraries in most languages, so please avoid adding external dependencies. Whilst we’re happy to use external libraries (especially open source) in our production code, in this test we’re looking at your coding ability, not your ability to find a solution to our test using an external library.

## Quality Counts

The test might seem simple, but please still write your solution as if you were going to push it into production. 

We’re not looking for ‘smart’ solutions in the fewest lines possible that no one can understand, just as we’re not looking for who can make it work with the [most lines of code](https://github.com/EnterpriseQualityCoding/FizzBuzzEnterpriseEdition) - we’re after good, testable and maintainable code.

A submission with one giant method won’t help us understand what you can really do.

## Tests!

We don’t let code without tests into our repositories, so code without tests will not meet the requirements of the task. Choose an appropriate testing framework for the language you’re using (we accept that this may conflict with the external dependencies section above in some languages).

Just to be clear, tests are NOT optional!

## Error Handling

If your code doesn’t run, we’ll spend a bit of time trying to debug it, but error messages and stack traces help - we are fellow developers after all and want you to progress. 

As with all production code, think about how your code may fail and deal with those possibilities appropriately. If your code needs to read a CSV from disk and it isn’t there, then print out an error message, including where your program was looking and exit. Whilst handling errors is smiled upon, `rescue` / `catch` from the base `Exception` class and silently continuing will not be considered a solution!

## Development Process and Tooling

We use Git for version control at GreenSync so we want you to use it whilst developing your solution for this test. We’re not expecting you to create feature branches for each requirement, but one huge commit once everything is complete is frowned upon.

Your commit history will help to show your thinking process. Trying something that doesn’t work is fine, it’s part of the development process and won’t negatively impact how we score your submission. Your commit history will also show us when you added your tests! (HINT!!!)

Most languages provide tools for building and managing dependencies, for example a Gemfile in Ruby, or a pom for Java - where appropriate, use them. We use Docker for deployment and in a lot of cases for running tests. If this is part of your normal workflow, feel free to add a Dockerfile (but don’t feel that you have to).

## Details!

We’re looking for developers with an attention to detail. Here is a list of details that might not seem important, but are things we’re looking out for:

* Coding style
  * Use a style appropriate to the language you’re writing in, ie don’t write Ruby styled Java
  * Variable names - use meaningful ones
  * Formatting is important! But we’re not going to care if your formatting is different from ours, just be consistent and readable
* Check you’re speling and grammar
* “It works on my machine”
  * Don’t hard code paths to files
  * Make sure all of your imports are going to work
* Prove you have read this! Please put the text “I love ducks” at the bottom of the README.md file
* Don’t commit unneeded files (eg IDE project files), use a .gitignore file
* Make appropriate Git commits, don’t complete the whole test and then commit everything

Good luck, and please contact us if there is anything that is unclear.







These instructions were inspired by: http://engineering.lonelyplanet.com/2014/07/28/How-To-Pass-A-Coding-Test.html

