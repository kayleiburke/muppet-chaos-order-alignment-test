# arr = (13..162).step(1).to_a
#
# # arr.each do |x|
# #   [1, 2, 3, 4, 5, 6].each do |y|
# #     puts x
# #     #puts y
# #   end
# # end
#
# arr = (1..30).step(1).to_a
#
# arr.each do |x|
#
# end

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

quiz_outcome_values = [
    config1, config2, config3, config4, config5, config2, config2, config3,
    config4, config5, config1, config5, config13, config3, config3, config5,
    config4, config5, config4, config13, config4, config13, config2, config1,
    config13, config1, config2, config13, config3, config1
].flatten

quiz_outcome_values.each do |x|
  puts x
end