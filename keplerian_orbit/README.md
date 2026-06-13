# Keplerian Orbit Simulation

## Problem Statement
To simulate the Keplerian orbit of a planet around a star 
using the Lagrangian formulation of classical mechanics, 
and to study the effect of orbital eccentricity on 
trajectory shape and orbital period.

## Methodology

The Lagrangian of the Earth is formulated in polar coordinates (r, θ): 

$$ℒ = \frac{1}{2}m(\dot{r}^2 + r^2\dot{\theta}^2) + \frac{GMm}{r}$$

The Euler-Lagrange equations are applied to yield two 
coupled second-order ODEs:

$$\ddot{r} = r\dot{\theta}^2 - \frac{GM}{r^2}$$

$$\ddot{\theta} = -\frac{2\dot{r}\dot{\theta}}{r}$$

The θ equation directly expresses the conservation of 
angular momentum, which is a consequence of rotational symmetry 
explained by Noether's theorem.

These are decomposed into a system of four first-order ODEs 
and solved numerically using RK4 with the appropriate initial conditions. 

Cartesian coordinates are recovered via:

$$x = r\cos\theta \qquad y = r\sin\theta$$

and plotted to visualise the orbit. 

## Initial Conditions

| Parameter | Case 1 (Earth) | Case 2 (e = 0.5) |
|---|---|---|
| Perihelion distance | 1.471 × 10¹¹ m | 1.471 × 10¹¹ m |
| Eccentricity | 0.0164 | 0.5 |
| Semi-major axis | 1.496 × 10¹¹ m | 2.942 × 10¹¹ m |
| Perihelion velocity | 30,290 m/s | 36,889 m/s |
| Initial ṙ | 0 m/s | 0 m/s |

## Results

### Case 1 — Earth's Orbit (e = 0.0164)
- Orbital period: 3.1536 × 10⁷ s (1 Earth year) 
- Perihelion: 1.471 × 10¹¹ m 
- Aphelion: 1.520 × 10¹¹ m 
- A nearly circular orbit is generated 
- Angular momentum is conserved throughout

### Case 2 — High Eccentricity (e = 0.5)
- Orbital period: 9.57 × 10⁷ s (~3.03 Earth years)
- Aphelion extends to 4.413 × 10¹¹ m (~3 AU)
- Star visibly offset to one focus, confirming Kepler's First law. 
- Longer period consistent with Kepler's Third Law: 
  T² ∝ a³

  <img width="1151" height="767" alt="image" src="https://github.com/user-attachments/assets/12856cc3-7c47-4698-96fe-2837dcb0a182" />
