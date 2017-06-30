﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UICamera : MonoBehaviour {
	void Awake() {
		Start();
	}

	// Use this for initialization
	void Start () {
		GameData.uiCamera = GetComponent<Camera>();
	}
}
