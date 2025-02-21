# set up completion for kubernetes CLI tools
if command -v kubectl &> /dev/null ; then
  eval "$(kubectl completion bash)"
fi
if command -v oc &> /dev/null ; then
  eval "$(oc completion bash)"
fi
if command -v cmctl &> /dev/null ; then
  eval "$(cmctl completion bash)"
fi
