#!/bin/bash
bin/rails db:migrate:reset
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed
