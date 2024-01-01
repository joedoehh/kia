#!/usr/bin/env bash

kubectl exec -it quiz -c mongo -- mongo kiada <<EOF
db.questions.insert({
  id: 1,
  text: "What does k8s mean?",
  answers: ["Kates", "Kubernetes", "Kooba Dooba Doo!"],
  correctAnswerIndex: 1
})
db.questions.insert({
  id: 2,
  text: "What big lake is in the center of Hamburg?",
  answers: ["Alster", "Bodensee", "Steinhuder Meer"],
  correctAnswerIndex: 0
})
EOF