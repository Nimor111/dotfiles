#!/bin/bash

kill -9 $(ps aux | grep $1)
