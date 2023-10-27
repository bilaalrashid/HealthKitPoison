//
//  Personas.swift
//  HealthKitPoison
//
//  Created by Bilaal Rashid on 27/10/2023.
//

import Foundation

struct Personas {

    static let weekdays: [[Int: ActivityLevel]] = [
        [
            0: .resting,
            1: .resting,
            2: .resting,
            3: .resting,
            4: .resting,
            5: .resting,
            6: .resting,
            7: .resting,
            8: .awake,
            9: .mediumIntensity,
            10: .awake,
            11: .mediumIntensity,
            12: .highIntensity,
            13: .mediumIntensity,
            14: .lowIntensity,
            15: .awake,
            16: .mediumIntensity,
            17: .highIntensity,
            18: .awake,
            19: .extremeIntensity,
            20: .mediumIntensity,
            21: .awake,
            22: .resting,
            23: .resting,
        ],
        [
            0: .resting,
            1: .resting,
            2: .resting,
            3: .resting,
            4: .resting,
            5: .resting,
            6: .resting,
            7: .resting,
            8: .awake,
            9: .lowIntensity,
            10: .awake,
            11: .awake,
            12: .highIntensity,
            13: .mediumIntensity,
            14: .highIntensity,
            15: .lowIntensity,
            16: .mediumIntensity,
            17: .highIntensity,
            18: .awake,
            19: .extremeIntensity,
            20: .highIntensity,
            21: .lowIntensity,
            22: .awake,
            23: .resting,
        ],
        [
            0: .resting,
            1: .resting,
            2: .resting,
            3: .resting,
            4: .resting,
            5: .resting,
            6: .awake,
            7: .awake,
            8: .mediumIntensity,
            9: .highIntensity,
            10: .lowIntensity,
            11: .mediumIntensity,
            12: .awake,
            13: .highIntensity,
            14: .mediumIntensity,
            15: .awake,
            16: .highIntensity,
            17: .lowIntensity,
            18: .extremeIntensity,
            19: .mediumIntensity,
            20: .lowIntensity,
            21: .resting,
            22: .resting,
            23: .resting,
        ],
        [
            0: .resting,
            1: .resting,
            2: .resting,
            3: .resting,
            4: .resting,
            5: .resting,
            6: .resting,
            7: .awake,
            8: .mediumIntensity,
            9: .highIntensity,
            10: .lowIntensity,
            11: .mediumIntensity,
            12: .mediumIntensity,
            13: .highIntensity,
            14: .highIntensity,
            15: .highIntensity,
            16: .mediumIntensity,
            17: .highIntensity,
            18: .mediumIntensity,
            19: .lowIntensity,
            20: .lowIntensity,
            21: .awake,
            22: .resting,
            23: .resting,
        ],
        [
            0: .resting,
            1: .resting,
            2: .resting,
            3: .resting,
            4: .resting,
            5: .resting,
            6: .resting,
            7: .resting,
            8: .awake,
            9: .mediumIntensity,
            10: .awake,
            11: .lowIntensity,
            12: .mediumIntensity,
            13: .mediumIntensity,
            14: .highIntensity,
            15: .awake,
            16: .lowIntensity,
            17: .mediumIntensity,
            18: .awake,
            19: .extremeIntensity,
            20: .mediumIntensity,
            21: .lowIntensity,
            22: .awake,
            23: .awake,
        ],
        [
            0: .resting,
            1: .resting,
            2: .resting,
            3: .resting,
            4: .resting,
            5: .resting,
            6: .resting,
            7: .resting,
            8: .awake,
            9: .mediumIntensity,
            10: .awake,
            11: .lowIntensity,
            12: .mediumIntensity,
            13: .mediumIntensity,
            14: .highIntensity,
            15: .awake,
            16: .lowIntensity,
            17: .mediumIntensity,
            18: .awake,
            19: .extremeIntensity,
            20: .mediumIntensity,
            21: .lowIntensity,
            22: .awake,
            23: .awake,
        ],
        [
            0: .resting,
            1: .resting,
            2: .resting,
            3: .resting,
            4: .resting,
            5: .resting,
            6: .resting,
            7: .awake,
            8: .mediumIntensity,
            9: .highIntensity,
            10: .lowIntensity,
            11: .mediumIntensity,
            12: .mediumIntensity,
            13: .highIntensity,
            14: .lowIntensity,
            15: .lowIntensity,
            16: .mediumIntensity,
            17: .highIntensity,
            18: .mediumIntensity,
            19: .lowIntensity,
            20: .lowIntensity,
            21: .awake,
            22: .resting,
            23: .resting,
        ],
        [
            0: .resting,
            1: .resting,
            2: .resting,
            3: .resting,
            4: .resting,
            5: .resting,
            6: .resting,
            7: .lowIntensity,
            8: .mediumIntensity,
            9: .highIntensity,
            10: .lowIntensity,
            11: .mediumIntensity,
            12: .lowIntensity,
            13: .mediumIntensity,
            14: .lowIntensity,
            15: .lowIntensity,
            16: .mediumIntensity,
            17: .highIntensity,
            18: .highIntensity,
            19: .extremeIntensity,
            20: .lowIntensity,
            21: .awake,
            22: .resting,
            23: .resting,
        ],
        [
            0: .resting,
            1: .resting,
            2: .resting,
            3: .resting,
            4: .resting,
            5: .resting,
            6: .lowIntensity,
            7: .highIntensity,
            8: .extremeIntensity,
            9: .highIntensity,
            10: .lowIntensity,
            11: .mediumIntensity,
            12: .lowIntensity,
            13: .mediumIntensity,
            14: .lowIntensity,
            15: .lowIntensity,
            16: .mediumIntensity,
            17: .lowIntensity,
            18: .mediumIntensity,
            19: .lowIntensity,
            20: .lowIntensity,
            21: .awake,
            22: .resting,
            23: .resting,
        ]
    ]

    static let weekend: [[Int: ActivityLevel]] = [
        [
            0: .resting,
            1: .resting,
            2: .resting,
            3: .resting,
            4: .resting,
            5: .resting,
            6: .resting,
            7: .resting,
            8: .resting,
            9: .awake,
            10: .lowIntensity,
            11: .lowIntensity,
            12: .mediumIntensity,
            13: .mediumIntensity,
            14: .mediumIntensity,
            15: .awake,
            16: .lowIntensity,
            17: .mediumIntensity,
            18: .awake,
            19: .lowIntensity,
            20: .lowIntensity,
            21: .lowIntensity,
            22: .awake,
            23: .resting,
        ],
        [
            0: .resting,
            1: .resting,
            2: .resting,
            3: .resting,
            4: .resting,
            5: .resting,
            6: .resting,
            7: .resting,
            8: .resting,
            9: .resting,
            10: .resting,
            11: .awake,
            12: .lowIntensity,
            13: .lowIntensity,
            14: .lowIntensity,
            15: .awake,
            16: .lowIntensity,
            17: .lowIntensity,
            18: .awake,
            19: .lowIntensity,
            20: .lowIntensity,
            21: .lowIntensity,
            22: .awake,
            23: .resting,
        ],
        [
            0: .lowIntensity,
            1: .resting,
            2: .resting,
            3: .resting,
            4: .resting,
            5: .resting,
            6: .resting,
            7: .resting,
            8: .resting,
            9: .resting,
            10: .lowIntensity,
            11: .awake,
            12: .lowIntensity,
            13: .mediumIntensity,
            14: .highIntensity,
            15: .awake,
            16: .lowIntensity,
            17: .lowIntensity,
            18: .awake,
            19: .lowIntensity,
            20: .mediumIntensity,
            21: .lowIntensity,
            22: .awake,
            23: .lowIntensity,
        ],
        [
            0: .resting,
            1: .resting,
            2: .resting,
            3: .resting,
            4: .resting,
            5: .resting,
            6: .resting,
            7: .resting,
            8: .resting,
            9: .resting,
            10: .lowIntensity,
            11: .awake,
            12: .lowIntensity,
            13: .mediumIntensity,
            14: .mediumIntensity,
            15: .awake,
            16: .lowIntensity,
            17: .lowIntensity,
            18: .awake,
            19: .lowIntensity,
            20: .awake,
            21: .lowIntensity,
            22: .awake,
            23: .resting,
        ],
        [
            0: .resting,
            1: .resting,
            2: .resting,
            3: .resting,
            4: .resting,
            5: .resting,
            6: .resting,
            7: .resting,
            8: .resting,
            9: .resting,
            10: .lowIntensity,
            11: .awake,
            12: .lowIntensity,
            13: .lowIntensity,
            14: .awake,
            15: .awake,
            16: .lowIntensity,
            17: .lowIntensity,
            18: .awake,
            19: .lowIntensity,
            20: .awake,
            21: .awake,
            22: .awake,
            23: .lowIntensity,
        ],
        [
            0: .resting,
            1: .resting,
            2: .resting,
            3: .resting,
            4: .resting,
            5: .resting,
            6: .resting,
            7: .resting,
            8: .resting,
            9: .awake,
            10: .lowIntensity,
            11: .awake,
            12: .mediumIntensity,
            13: .highIntensity,
            14: .mediumIntensity,
            15: .mediumIntensity,
            16: .lowIntensity,
            17: .highIntensity,
            18: .lowIntensity,
            19: .lowIntensity,
            20: .awake,
            21: .awake,
            22: .awake,
            23: .lowIntensity,
        ]
    ]

    static let anomalies: [[Int: ActivityLevel]] = [
        [
            0: .resting,
            1: .resting,
            2: .resting,
            3: .resting,
            4: .resting,
            5: .resting,
            6: .resting,
            7: .resting,
            8: .resting,
            9: .resting,
            10: .resting,
            11: .resting,
            12: .awake,
            13: .awake,
            14: .awake,
            15: .resting,
            16: .awake,
            17: .awake,
            18: .resting,
            19: .resting,
            20: .awake,
            21: .resting,
            22: .resting,
            23: .resting,
        ],
        [
            0: .resting,
            1: .resting,
            2: .resting,
            3: .resting,
            4: .resting,
            5: .resting,
            6: .resting,
            7: .resting,
            8: .resting,
            9: .resting,
            10: .resting,
            11: .resting,
            12: .resting,
            13: .resting,
            14: .resting,
            15: .resting,
            16: .resting,
            17: .resting,
            18: .resting,
            19: .resting,
            20: .resting,
            21: .resting,
            22: .resting,
            23: .resting,
        ],
        [
            0: .resting,
            1: .resting,
            2: .resting,
            3: .resting,
            4: .resting,
            5: .resting,
            6: .resting,
            7: .resting,
            8: .resting,
            9: .awake,
            10: .lowIntensity,
            11: .mediumIntensity,
            12: .mediumIntensity,
            13: .mediumIntensity,
            14: .resting,
            15: .resting,
            16: .resting,
            17: .resting,
            18: .resting,
            19: .resting,
            20: .resting,
            21: .resting,
            22: .resting,
            23: .resting,
        ],
        [
            0: .resting,
            1: .awake,
            2: .resting,
            3: .resting,
            4: .resting,
            5: .resting,
            6: .resting,
            7: .resting,
            8: .resting,
            9: .resting,
            10: .resting,
            11: .resting,
            12: .resting,
            13: .resting,
            14: .resting,
            15: .resting,
            16: .resting,
            17: .resting,
            18: .resting,
            19: .mediumIntensity,
            20: .mediumIntensity,
            21: .lowIntensity,
            22: .awake,
            23: .resting,
        ],
        [
            0: .resting,
            1: .lowIntensity,
            2: .resting,
            3: .resting,
            4: .resting,
            5: .resting,
            6: .resting,
            7: .awake,
            8: .mediumIntensity,
            9: .highIntensity,
            10: .lowIntensity,
            11: .mediumIntensity,
            12: .mediumIntensity,
            13: .lowIntensity,
            14: .lowIntensity,
            15: .lowIntensity,
            16: .mediumIntensity,
            17: .highIntensity,
            18: .mediumIntensity,
            19: .lowIntensity,
            20: .lowIntensity,
            21: .awake,
            22: .resting,
            23: .resting,
        ],
        [
            0: .resting,
            1: .resting,
            2: .resting,
            3: .resting,
            4: .resting,
            5: .awake,
            6: .lowIntensity,
            7: .mediumIntensity,
            8: .mediumIntensity,
            9: .highIntensity,
            10: .highIntensity,
            11: .mediumIntensity,
            12: .highIntensity,
            13: .mediumIntensity,
            14: .highIntensity,
            15: .highIntensity,
            16: .extremeIntensity,
            17: .highIntensity,
            18: .lowIntensity,
            19: .awake,
            20: .lowIntensity,
            21: .awake,
            22: .resting,
            23: .resting,
        ],
        [
            0: .resting,
            1: .resting,
            2: .resting,
            3: .resting,
            4: .resting,
            5: .resting,
            6: .resting,
            7: .resting,
            8: .resting,
            9: .resting,
            10: .lowIntensity,
            11: .lowIntensity,
            12: .lowIntensity,
            13: .lowIntensity,
            14: .mediumIntensity,
            15: .highIntensity,
            16: .highIntensity,
            17: .extremeIntensity,
            18: .highIntensity,
            19: .highIntensity,
            20: .lowIntensity,
            21: .awake,
            22: .lowIntensity,
            23: .awake,
        ]
    ]

}