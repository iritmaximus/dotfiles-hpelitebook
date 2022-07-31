#!/bin/bash

# Current layout
symbol=$(xkblayout-state print %s)
name=$(xkblayout-state print %n)
number=$(xkblayout-state print %c)
variant=$(xkblayout-state print %v)

echo Current layout symbol: $symbol
echo Current layout name: $name
echo Current layout number: $number
echo Current layout variant: $variant


if [ $symbol = fi ]
then
    setxkbmap us
    xmodmap ~/.keyboards/.Xmodmap
    echo Switched to Arkkudvorak
else
    setxkbmap fi
    echo Switched to Finnish
fi