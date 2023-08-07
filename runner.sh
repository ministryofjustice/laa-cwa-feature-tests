#!/bin/bash
echo first run
date
bundle exec parallel_cucumber features/validations/legal_help/IAbulk -n 6
date
# echo secound run
# date
# cucumber features/validations/legal_help/IAbulk/1.feature
# date
# echo third run
# date
# cucumber features/validations/legal_help/IAbulk/1.feature
# date
# echo fourth run
# date
# cucumber features/validations/legal_help/IAbulk/1.feature
# date
# echo Fifth run
# date
# cucumber features/validations/legal_help/IAbulk/1.feature
# date
