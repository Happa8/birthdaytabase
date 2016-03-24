#!/bin/bash
rm db/development.db
rake db:migrate
rake db:seed
