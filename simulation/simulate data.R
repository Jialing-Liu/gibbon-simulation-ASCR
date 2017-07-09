set.seed(2345)
traps <- generate_traps(spacing=400)
capture <- capture_history(traps=traps, density=0.04, sigma=1000,
                           hardcore = list(beta=1e-2, hc=350))

as_capture <- convert_to_ascr(capture, kappa = 5)
