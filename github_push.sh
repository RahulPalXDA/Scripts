#!/bin/bash

#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

GITHUB_USERNAME="YOUR_USERNAME_HERE"
GITHUB_EMAIL="YOUR_GITHUB_EMAIL_HERE"
GITHUB_TOKEN="YOUR_GITHUB_TOKEN_HERE"

function SETUP() {
	git config user.name $GITHUB_USERNAME
	git config user.email $GITHUB_EMAIL
	git config core.editor nano
	mkdir /tmp/GITHUB
}

function GET_REPO() {
	git remote -v | grep push >> /tmp/GITHUB/PUSH_REMOTE
	awk -F ' ' '{print $2;}' /tmp/GITHUB/PUSH_REMOTE >> /tmp/GITHUB/REPO_URL
        awk -F '/' '{print $4;}' /tmp/GITHUB/REPO_URL >> /tmp/GITHUB/REPO_USERNAME
	awk -F '/' '{print $5;}' /tmp/GITHUB/REPO_URL >> /tmp/GITHUB/REPO
        REPO_USERNAME=$(cat /tmp/GITHUB/REPO_USERNAME)
	REPO=$(cat /tmp/GITHUB/REPO)
}

function CLEANING() {
	rm -rf /tmp/GITHUB/*
	rmdir /tmp/GITHUB
}

SETUP
GET_REPO
git push https://$GITHUB_TOKEN@github.com/$REPO_USERNAME/$REPO
CLEANING
