
import 'dart:async';

class ValidatorsTask {

    final validarname = StreamTransformer<String, String>.fromHandlers(
    handleData: (name,sink){

      if (name.length > 1) {
        if (name.length<45) {

          sink.add(name);

        }else{
          sink.addError('El nombre no debe contener mas de 45 caracteres');

        }

      }else{
        sink.addError('El nombre es requerido');
      }
    }
  );

    final validarDescription = StreamTransformer<String, String>.fromHandlers(
    handleData: (name,sink){

      if (name.length<5) {

        sink.add(name);

      }else{
        sink.addError('La descripcion no debe contener mas de 255 caracteres');

        }
    }
  );



}