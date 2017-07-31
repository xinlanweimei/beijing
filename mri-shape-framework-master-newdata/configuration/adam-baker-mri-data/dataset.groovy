bootstrapTongue{
  iterations = 20
  selectedIteration = 20

  modelFidelity{
    priorSize = 2
    samples = 10000
    convergenceFactor = 10000000
    projectedGradientTolerance = 0.00001
    maxFunctionEvals = 1000
  }

}

bootstrapPalate{
  active = true
  // one iteration seems to work
  iterations = 1
  selectedIteration = 1
}


evaluation{
  priorSize = 2
  convergenceFactor = 10000000
  projectedGradientTolerance = 0.00001
  maxFunctionEvals = 1000
  // sample amount for specificity
  samples = 1000000
  // truncated modes for specificity
  truncatedPhoneme = 4
  truncatedSpeaker = 1
  subsets = ["bladetip", "combined", "bladebackdorsum"]
}

finalModel{
  truncatedSpeaker = 1
  truncatedPhoneme = 4
}

finalPalateModel{
  truncatedSpeaker = 1
}

procrustesPalate{
  originIndex = 93
  iter = 40
}

dataset{
  name = "adam-baker-mri-data"
  speakers = ["01MRIM"]
}
