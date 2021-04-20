# frozen_string_literal: true

module DistanceRecords

    class Creator < ApplicationService
        def initialize(params, distance_record_params)
          @params                  = params
          @distance_record_params  = distance_record_params
          @distance_record         = nil
          @response                = Hash.new()
        end

        def call

          if calculate_distance
            instance_distance_record
            save_distance_record
          else
            @response[:error] = "Ocurrio un error calculado la distancia entre los dos puntos, por favor verifique las direcciones e intente de nuevo."
          end

          return @distance_record, @response
        end

        private

        def instance_distance_record
          @distance_record = DistanceRecord.new(@distance_record_params)
          @distance_record.distance_in_between = @distance
        end

        def calculate_distance
          initial_point = GeoRb::Location.lookup(@distance_record_params[:initial_point])
          final_point = GeoRb::Location.lookup(@distance_record_params[:final_point])
          @distance = initial_point&.distance_to(final_point)&.km
        end

        def save_distance_record
          if @distance_record.save
            @response[:success]= "Guardado correctamente"
          else
            @response[:error] = "No se pudo guardar"
          end
        end

    end
  end
