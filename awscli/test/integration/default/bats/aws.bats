#!/usr/bin/env bats

@test "aws binary is found in PATH" {
  run which aws
  [ "$status" -eq 0 ]
}