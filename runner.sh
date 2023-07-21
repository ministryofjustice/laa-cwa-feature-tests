#!/bin/bash
date
bundle exec parallel_cucumber features/validations/legal_help/IAbulk -n 6 
date