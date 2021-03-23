##
##
## Script to generate the values column (of the choices_outcomes.csv file) for the muppet quiz
##
##

# rows are outcomes, columns are ratings:
#
#                        |strongly disagree | disagree | neutral | agree | strongly agree |
#     ------------------------------------------------------------------------------------
#     mind-order         |                  |          |         |       |                |
#     mind-chaos         |                  |          |         |       |                |
#     appearance- order  |                  |          |         |       |                |
#     appearance- chaos  |                  |          |         |       |                |
#     action - order     |                  |          |         |       |                |
#     action - chaos     |                  |          |         |       |                |

# config for muppet question 1
config1 = [
    2, 1, 0, 0, 0,
    0, 0, 0, 1, 2,
    0, 0, 0, 0, 0,
    0, 0, 0, 0, 0,
    0, 0, 0, 0, 0,
    0, 0, 0, 0, 0]

# config for muppet question 2
config2 = [
    0, 0, 0, 1, 2,
    2, 1, 0, 0, 0,
    0, 0, 0, 0, 0,
    0, 0, 0, 0, 0,
    0, 0, 0, 0, 0,
    0, 0, 0, 0, 0]

# config for muppet question 3
config3 = [
    0, 0, 0, 0, 0,
    0, 0, 0, 0, 0,
    0, 0, 0, 1, 2,
    2, 1, 0, 0, 0,
    0, 0, 0, 0, 0,
    0, 0, 0, 0, 0]

# config for muppet question 4
config4 = [
    0, 0, 0, 0, 0,
    0, 0, 0, 0, 0,
    2, 1, 0, 0, 0,
    0, 0, 0, 1, 2,
    0, 0, 0, 0, 0,
    0, 0, 0, 0, 0]

# config for muppet question 5
config5 = [
    0, 0, 0, 0, 0,
    0, 0, 0, 0, 0,
    0, 0, 0, 0, 0,
    0, 0, 0, 0, 0,
    0, 0, 0, 1, 2,
    2, 1, 0, 0, 0]

# config for muppet question 13
config13 = [
    0, 0, 0, 0, 0,
    0, 0, 0, 0, 0,
    0, 0, 0, 0, 0,
    0, 0, 0, 0, 0,
    2, 1, 0, 0, 0,
    0, 0, 0, 1, 2]

# the quiz is constructed of 30 questions; each config in the array below corresponds to a question
# questions are in order from 1 to 30
quiz_outcome_values = [
    config1, config2, config3, config4, config5, config2, config2, config3,
    config4, config5, config1, config5, config13, config3, config3, config5,
    config4, config5, config4, config13, config4, config13, config2, config1,
    config13, config1, config2, config13, config3, config1
].flatten

quiz_outcome_values.each do |x|
  puts x
end