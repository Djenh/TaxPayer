import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/utils/logger_util.dart';


enum ConnectivityStatus { wifi, mobile, none }

class ConnectivityService {
  static final ConnectivityService _instance = ConnectivityService._internal();

  factory ConnectivityService() => _instance;

  ConnectivityService._internal();

  final Connectivity _connectivity = Connectivity();
  ConnectivityStatus _status = ConnectivityStatus.none;
  BuildContext? _context;

  // Callbacks pour les événements de connectivité
  Function(ConnectivityStatus)? onStatusChange;
  Function(ConnectivityStatus, ConnectivityStatus)? onDetailedStatusChange;


  void initialize(
    BuildContext context, {
    Function(ConnectivityStatus)? onStatusChange,
    Function(ConnectivityStatus, ConnectivityStatus)? onDetailedStatusChange,
  }) {
    _context = context;
    this.onStatusChange = onStatusChange;
    this.onDetailedStatusChange = onDetailedStatusChange;

    _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      _handleConnectivityResults(results);
    });
    checkInitialConnection();
  }

  Future<void> checkInitialConnection() async {
    final List<ConnectivityResult> results =
        await _connectivity.checkConnectivity();
    _handleConnectivityResults(results);
  }

  void _handleConnectivityResults(List<ConnectivityResult> results) {
    if (_context == null) return;

    // Convertir la liste de résultats en un seul statut
    final ConnectivityStatus oldStatus = _status;
    _status = _convertResults(results);

    // Notification des changements
    if (oldStatus != _status) {
      onStatusChange?.call(_status);
      onDetailedStatusChange?.call(oldStatus, _status);
      _showConnectivityToast(oldStatus, _status);
    }
  }

  ConnectivityStatus _convertResults(List<ConnectivityResult> results) {
    if (results.isEmpty) return ConnectivityStatus.none;

    if (results.contains(ConnectivityResult.wifi)) {
      return ConnectivityStatus.wifi;
    } else if (results.contains(ConnectivityResult.mobile)) {
      return ConnectivityStatus.mobile;
    } else {
      return ConnectivityStatus.none;
    }
  }

  void _showConnectivityToast(
      ConnectivityStatus oldStatus, ConnectivityStatus newStatus) {
    if (_context == null) return;

    final String msg = _getStatusMessage(oldStatus, newStatus);

    if (newStatus == ConnectivityStatus.none) {
      //toast msg
      AppLogger.info(msg);
    } else if (oldStatus == ConnectivityStatus.none) {
      //toast msg
      AppLogger.info(msg);
    } else {
      //toast msg
      AppLogger.info(msg);
    }
  }

  String _getStatusMessage(
      ConnectivityStatus oldStatus, ConnectivityStatus newStatus) {
    if (newStatus == ConnectivityStatus.none) {
      return "Connexion internet perdue";
    } else if (oldStatus == ConnectivityStatus.none) {
      return "Connexion internet rétablie";
    } else {
      return "Changement de connexion";
    }
  }


  ConnectivityStatus get status => _status;

  bool get isConnected => _status != ConnectivityStatus.none;
}
